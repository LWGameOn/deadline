class HitmenController < ApplicationController
  def index
    @hitmen = Hitman.all
  end

  def show
    @hitman = Hitman.find(params[:id])
  end
end
