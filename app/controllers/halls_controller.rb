class HallsController < ApplicationController
  before_action :set_hall, only: [:edit, :update, :destroy]

  def index
    @hall = Hall.new
    @halls = Hall.where(id: current_user.id)
  end

  def create
    @hall = Hall.new(hall_params)
    if @hall.save
      redirect_to halls_path
    else
      @halls = Hall.all
      render :index
    end
  end

  def edit
  end

  def update
    if @hall.update(hall_params)
      redirect_to halls_path
    else
      render :edit
    end
  end

  def destroy
    @hall.destroy
    redirect_to halls_path
  end

  private

  def set_hall
    @hall = Hall.find(params[:id])
  end

  def hall_params
    params.require(:hall).permit(:store).merge(user_id: current_user.id)
  end
end
