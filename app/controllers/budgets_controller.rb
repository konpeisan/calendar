class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
  end

  def new
    @budget = Budget.new
  end

  def create
    Budget.create(budget_params)
    redirect_to root_path
  end

  private
  def budget_params
    params.require(:budget).permit(:start_time,:price,:recovery,:yen_id,:sum,:memo,:image)
  end
end
