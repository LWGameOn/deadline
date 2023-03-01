class HitmenController < ApplicationController
  before_action :set_hitman, only: :show

  def index
    @hitmen = Hitman.all
  end

  def new
    @hitman = Hitman.new
  end

  def create
    @hitman = Hitman.new(hitman_params)
    @hitman.user = current_user
    if @hitman.save!
      redirect_to hitman_path(@hitman)
    else
      render :new, status: :bad_request
    end
  end

  def show
  end

  private

  def set_hitman
    @hitman = Hitman.find(params[:id])
  end

  def hitman_params
    params.require(:hitman).permit(:name, :bio, :method, :location)
  end
end
