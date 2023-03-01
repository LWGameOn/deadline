class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def home
  end

  def index
    # Index jobs the user's hitmen are assigned to
    @hitman = Hitman.where(user: current_user).first
    @jobs = Job.where(user: current_user)
  end
end
