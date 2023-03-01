class PagesController < ApplicationController
  def home
  end

  def index
    # Index jobs the user's hitmen are assigned to
    @hitmen = Hitman.where(user: current_user)
  end
end
