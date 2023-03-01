class PagesController < ApplicationController
  def home
  end

  def index
    # Index jobs the user's hitmen are assigned to
    @hitman = Hitman.find_by user: current_user
    @jobs = Job.where(hitman: @hitman)
  end
end
