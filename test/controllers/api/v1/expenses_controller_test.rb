require 'test_helper'

module Api
  module V1
    class ExpensesControllerTest < ActionDispatch::IntegrationTest
      setup do
        @expense = expenses(:one)
      end

      test "should get index in json format" do
        get api_v1_expenses_url
        assert_response :success
      end

      test "should show expense in json format" do
        get api_v1_expenses_url(@expense)
        assert_response :success
      end

      test "should create expense in json format" do
        assert_difference 'Expense.count', 1 do
          post api_v1_expenses_url, params: { expense: { amount: 2345, category_id: 1, concept: 'Created concept', date: Date.today, type_id: 1 } }
        end
        assert_response :success
        assert_equal 2345.0, Expense.last.amount
        assert_equal 1, Expense.last.category_id
        assert_equal 'Created concept', Expense.last.concept
        assert_equal Date.today, Expense.last.date
        assert_equal 1, Expense.last.type_id
      end

      test "should update expense amount in json format" do
        assert_difference 'Expense.count', 0 do
          patch api_v1_expense_url(@expense), params: { expense: { amount: 11.1} }
        end
        assert_response :success
        assert_equal 11.1, Expense.last.amount
      end

      test "should update expense category  in json format" do
        patch api_v1_expense_url(@expense), params: { expense: {category: 1 } }
        assert_response :success
        assert_equal "Restaurants", Expense.last.category.name
      end

      test "should update expense concept api_v1_expense_url" do
        patch api_v1_expense_url(@expense), params: { expense: { concept: "Edited concept" } }
        assert_response :success
        assert_equal "Edited concept", Expense.last.concept
      end

      test "should update expense date api_v1_expense_url" do
        patch api_v1_expense_url(@expense), params: { expense: { date: Date.today } }
        assert_response :success
        assert_equal Date.today, Expense.last.date
      end

      test "should update expense type api_v1_expense_url" do
        patch api_v1_expense_url(@expense), params: { expense: { type:1 } }
        assert_response :success
        assert_equal "Purchase", Expense.last.type.name
      end

      test "should destroy expense api_v1_expense_url" do
        assert_difference('Expense.count', -1) do
          delete api_v1_expense_url(@expense)
        end
        assert_response :success
      end
    end
  end
end
