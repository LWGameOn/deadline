class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def home
    render layout: "landing"
  end

  def index
    # Index jobs the user's hitmen are assigned to
    @hitman = Hitman.find_by(user: current_user)
    @jobs = Job.where(hitman: @hitman)
    @requests = Job.where(user: current_user)
  end
end
