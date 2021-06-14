class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
  end

  def new
    @budget = Budget.new
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
    @budget = Budget.find(params[:id])
    @day_params = params[:format]
  end

  def update
    @budget = Budget.find(params[:id])
    if @budget.update(budget_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy
    redirect_to root_path
  end

  private
  def budget_params
    params.require(:budget).permit(:start_time,:price,:recovery,:yen_id,:total,:memo,:image)
  end
end
