class TypesController < ApplicationController
  before_action :set_type, only: [:edit, :update, :destroy]
  before_action :move_to_index, except: [:index]


  def index
    @type = Type.new
    @types = Type.where(id: current_user.id)
  end

  def create
    @type = Type.new(type_params)
    if @type.save
      redirect_to types_path
    else
      @types = Type.all
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
    unless user_signed_in? && current_user == @type.user
      redirect_to action: :index
    end
  end
end
