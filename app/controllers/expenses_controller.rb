class ExpensesController < ApplicationController
  before_action :filter
  def filter
    @expenses = Expense.order("date ASC")
    @expenses = @expenses.by_type(params[:type_id]) if params[:type_id]
    @expenses = @expenses.by_category(params[:category_id]) if params[:category_id]
    @expenses = @expenses.by_month(params[:date]) if params[:date]
  end

  def index
    @tab = :expenses
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.save
    respond_to do |format|
      format.js
    end
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: "The #{@expense.type.name} #{@expense.concept} for #{@expense.amount} on #{@expense.date} was successfully delete." }
      format.json { head :no_content }
    end
  end

  private
    def expense_params
      params.require(:expense).permit(:type_id, :date, :concept, :category_id, :amount)
    end
end
