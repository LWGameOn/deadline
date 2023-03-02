class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def home
  end

  def index
    # Index jobs the user's hitmen are assigned to
    @hitman = Hitman.find_by(user: current_user)
    @jobs = Job.where(hitman: @hitman)
    if params[:filter].present?
      @jobs = @jobs.where(status: params[:filter])
    end
    @requests = Job.where(user: current_user)
  end
end
