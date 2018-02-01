module Api
  module V1
    class ExpensesController < ApplicationController
      def index
        expenses = Expense.order("date ASC").by_type(params[:type_id]).by_category(params[:category_id])
        render json: expenses
      end

      def show
        expense = Expense.find(params[:id])
        render json: expense
      end


      def create
        expense = Expense.new(expense_params)
        if @expense.save
          render json: expense, status: 201
        else
          render json: {errors: expense.errors}, status: 422
        end
      end

      def update
        expense = Expense.find(params[:id])
        if @expense.update(expense_params)
          render json: expense, status: 200
        else
          render json: {errors: expense.errors}, status: 422
        end
      end

      def destroy
        expense = Expense.find(params[:id])
        expense.destroy
        head :no_content
      end

      private
        def expense_params
          params.require(:expense).permit(:type_id, :date, :concept, :category_id, :amount)
        end
    end
  end
end
