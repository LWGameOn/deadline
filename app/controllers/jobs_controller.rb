class JobsController < ApplicationController
  before_action :set_hitman, only: %i[new create]

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    @job.hitman_id = params[:hitman_id]
    @hitman = Hitman.find(params[:hitman_id])
    if @job.save!
      redirect_to job_path(@job)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, status: :see_other
  end

  private

  def job_params
    params.require(:job).permit(:deadline, :details, :location, :price)
  end

  def set_hitman
    @hitman = Hitman.find(params[:hitman_id])
  end
end
