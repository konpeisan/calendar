class BudgetsController < ApplicationController
  before_action :set_budget, only: [:edit,:update,:destroy]

  def index
    @budgets = Budget.all
  end

  def new
    @budget = Budget.new
    @day = params[:format]
    @day_params = Date._strptime(@day)
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
    @budgets = Budget.all
    @halls = Hall.all
    @types = Type.all
  end

  private
  def budget_params
    params.require(:budget).permit(:start_time,:price,:recovery,:total,:memo,:store_id,:type_name_id,:game_hour,:game_minute)
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
end
