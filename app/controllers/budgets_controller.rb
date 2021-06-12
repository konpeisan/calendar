class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.create(budget_params)
    @budget.total = @budget.recovery.to_i - @budget.price.to_i
    if @budget.save
      redirect_to budgets_path
    else
      render :new
    end
  end

  def edit
    @budget = Budget.find(params[:id])
  end

  def update
    @budget = Budget.find(params[:id])
    @budget.update(budget_params)
  end

  def destroy
  end

  private
  def budget_params
    params.require(:budget).permit(:start_time,:price,:recovery,:yen_id,:total,:memo,:image)
  end
end
