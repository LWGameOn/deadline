class HitmenController < ApplicationController
  before_action :set_hitman, only: :show

  def index
    query = params[:query]

    if query.present?
      @hitmen = Hitman.search_by_location_and_method(query)
    else
      @hitmen = Hitman.all
    end
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
    params.require(:hitman).permit(:name, :bio, :method, :location, :photo)
  end
end
