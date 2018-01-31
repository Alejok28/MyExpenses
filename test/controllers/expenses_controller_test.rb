require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense = expenses(:one)
  end

  test "should get index" do
    get expenses_url
    assert_response :success
  end

  test "should get index in js format" do
    get expenses_url, xhr: true
    assert_equal "text/javascript", @response.content_type
  end

  test "should show expense" do
    get expense_url(@expense)
    assert_response :success
  end

  test "should get new" do
    get new_expense_url, xhr: true
    assert_equal "text/javascript", @response.content_type
  end

  # test "should create expense" do
  #   assert_difference 'Expense.count' do
  #     post expenses_url, params: { expense: { amount: @expense.amount, category: @expense.category, concept: @expense.concept, date: @expense.date, type: @expense.type } }, xhr: true
  #   end
  #
  #   assert_response :success
  #   assert_equal 'Expense was successfully created.', flash[:notice]
  # end

  test "should get edit" do
    get edit_expense_url(@expense), xhr: true
    assert_response :success
    # assert_equal 'Expense was successfully destroyed.', flash[:notice]
  end

  # test "should update expense" do
  #   patch expense_url(@expense), params: { expense: { amount: @expense.amount, category: @expense.category, concept: @expense.concept, date: @expense.date, type: @expense.type } }
  #   assert_redirected_to expense_url(@expense)
  # end

  # test "should update expense" do
  #   patch expense_url(@expense), params: { expense: { concept: "Edited concept"}}
  #   assert_redirected_to expense_url(@expense), xhr: true
  # end

  test "should destroy expense" do
    assert_difference('Expense.count', -1) do
      delete expense_url(@expense)
    end
    assert_response :found
    assert_redirected_to expenses_url
    assert_equal 'Expense was successfully destroyed.', flash[:notice]
  end
end
