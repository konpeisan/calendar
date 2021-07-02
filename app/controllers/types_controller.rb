class TypesController < ApplicationController
  before_action :set_type, only: [:edit, :update, :destroy]

  def index
    @type = Type.new
    @types = Type.all
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
    params.require(:type).permit(:type_name,:pachinko,:slot)
  end
end
