class BudgetsController < ApplicationController
  before_action :set_budget, only: [:edit,:update,:destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @budgets = Budget.where(user_id: current_user.id)
  end

  def new
    @budget = Budget.new
    @day_params = params[:format]
    @day = Date._strptime(@day_params)
  end

  def create
    @budget = Budget.new(budget_params)
    keisan
    if @budget.save || initial_entry
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @day_params = params[:format]
  end

  def update
    if @budget.update(budget_params)
      keisan
      @budget.update(budget_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @budget.destroy
    redirect_to root_path
  end

  def analysis
    @budgets = Budget.where(user_id: current_user.id)
    @halls = Hall.where(user_id: current_user.id)
    @types = Type.where(user_id: current_user.id)
  end

  private
  def budget_params
    params.require(:budget).permit(:start_time,:price,:recovery,:total,:memo,:store_id,:type_name_id,:game_hour,:game_minute).merge(user_id: current_user.id)
  end

  def set_budget
    @budget = Budget.find(params[:id])
  end

  def keisan
    @budget.total = @budget.recovery.to_i - @budget.price.to_i
  end

  def initial_entry
    @budget.price = 0
    @budget.recovery = 0
    @budget.total = 0
    @budget.save
  end

  def move_to_index
    @budget = Budget.find(params[:id])
    unless current_user.id == @budget.user_id
      redirect_to action: :index
    end
  end
end
