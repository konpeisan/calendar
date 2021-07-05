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
    @budget.total = @budget.recovery.to_i - @budget.price.to_i
    if @budget.save
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

  def gallery
    @budgets = Budget.all
  end

  private
  def budget_params
    params.require(:budget).permit(:start_time,:price,:recovery,:yen_id,:total,:memo,:image,:store_id,:type_name_id)
  end

  def set_budget
    @budget = Budget.find(params[:id])
  end
end
