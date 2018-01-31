class ExpensesController < ApplicationController
  before_action :filter
  def filter
    @expenses = Expense.order("date ASC").by_type(params[:type_id]).by_category(params[:category_id]).by_month(params[:date])
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
    respond_to do |format|
      if @expense.save
        # format.html { redirect_to index, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
        format.js
      else
        # format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @expense = Expense.find(params[:id])
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to index, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def expense_params
      params.require(:expense).permit(:type_id, :date, :concept, :category_id, :amount)
    end
end
