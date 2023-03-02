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

  def edit
    @hitman = Hitman.find(params[:id])
  end

  def update
    @hitman = Hitman.find(params[:id])
    @hitman.update(hitman_params)
    redirect_to pages_path(@hitman)
  end

  def destroy
    @hitman = Hitman.find(params[:id])
    @hitman.destroy
    redirect_to pages_path, status: :see_other
  end

  private

  def set_hitman
    @hitman = Hitman.find(params[:id])
  end

  def hitman_params
    params.require(:hitman).permit(:name, :bio, :method, :location, :photo)
  end
end
