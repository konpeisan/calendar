class HallsController < ApplicationController
  before_action :set_hall, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @hall = Hall.new
    @halls = Hall.where(user_id: current_user.id)
    session[:previous_url] = request.referer
  end

  def create
    @hall = Hall.new(hall_params)
    if @hall.save
      if session[:previous_url].include?("/budgets/new") || session[:previous_url].include?("/edit")
        redirect_to session[:previous_url]
      else
        redirect_to halls_path
      end
    else
      @halls = Hall.where(user_id: current_user.id)
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

  def move_to_index
    @hall = Hall.find(params[:id])
    unless current_user.id == @hall.user_id
      redirect_to action: :index
    end
  end
end
