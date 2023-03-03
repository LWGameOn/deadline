class JobsController < ApplicationController
  before_action :set_hitman, only: %i[new create]
  def index
    # Index jobs the user has requested
    @hitman = Hitman.where(user: current_user)
  end

  def show
    @job = Job.find(params[:id])
    unless @job.user == current_user || @job.hitman.user == current_user
      # Job doesn't belong to current user
      redirect_to jobs_path, status: :bad_request
    end
  end

  def new
    @job = Job.new
    @form = true
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    @job.hitman_id = params[:hitman_id]
    @hitman = Hitman.find(params[:hitman_id])
    if @job.save!
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

  def accept
    @job = Job.find(params[:id])
    @job.update(status: 1)
    redirect_to pages_path
  end

  def deny
    @job = Job.find(params[:id])
    @job.update(status: 2)
    redirect_to pages_path
  end

  def completed
    @job = Job.find(params[:id])
    @job.update(status: 3)
    redirect_to pages_path
  end

  private

  def job_params
    params.require(:job).permit(:deadline, :details, :location, :price, :target_number)
  end

  def set_hitman
    @hitman = Hitman.find(params[:hitman_id])
  end
end
