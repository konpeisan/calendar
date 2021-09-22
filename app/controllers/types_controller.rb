class TypesController < ApplicationController
  before_action :set_type, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @type = Type.new
    @types = Type.where(user_id: current_user.id)
    session[:previous_url] = request.referer
  end

  def create
    @type = Type.new(type_params)
    if @type.save
      if session[:previous_url].include?("/budgets/new") || session[:previous_url].include?("/edit")
        redirect_to session[:previous_url]
      else
        redirect_to types_path
      end
    else
      @types = Type.where(user_id: current_user.id)
      render :index
    end
  end

  def edit
  end

  def update
    if @type.update(type_params)
      redirect_to types_path
    else
      render :edit
    end
  end

  def destroy
    @type.destroy
    redirect_to types_path
  end

  private

  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:type_name,:pachi_slot,:kind).merge(user_id: current_user.id)
  end

  def move_to_index
    @type = Type.find(params[:id])
    unless current_user.id == @type.user_id
      redirect_to action: :index
    end
  end
end
