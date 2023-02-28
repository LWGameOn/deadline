class JobsController < ApplicationController
  before_action :set_job, except: [:create, :new]

  def index
    @jobs = Job.where(user: current_user)
  end

  def show
    unless @job.user == current_user || @job.hitman.user == current_user
      # Job doesn't belong to current user
      redirect_to jobs_path, status: :bad_request
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_path(@job)
    else
      render :new, status: :bad_request
    end
  end

  def update
    if @job.user == current_user
      @job.update(job_params)
      redirect_to job_path(@job)
    else
      # Job doesn't belong to current user
      @job = false
      render :new, status: :bad_request
    end
  end

  def destroy
    if current_user == @job.user
      @job.destroy
      redirect_to jobs_path, status: :see_other
    else
      # Job doesn't belong to current user
      redirect_to jobs_path, status: :bad_request
    end
  end

  private

  def job_params
    params.require(:job).permit(:deadline, :details, :location)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end