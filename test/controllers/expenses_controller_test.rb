require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense = expenses(:one)
  end

  test "should get index" do
    get api_v1_expenses_url
    assert_response :success
  end

  test "should show expense" do
    get expense_url(@expense)
    assert_response :success
  end

  test "should get new" do
    get new_expense_url, xhr: true
    assert_equal "text/javascript", @response.content_type
  end

  test "should get edit" do
    get edit_expense_url(@expense), xhr: true
    assert_response :success
  end

  test "should create expense" do
    assert_difference 'Expense.count', 1 do
      post expenses_url, params: { expense: { amount: 2345, category_id: 1, concept: 'concept', date: Date.today, type_id: 1 } }, xhr: true
    end
    assert_response :success
    assert_match "The MyString concept for $2345.0 on #{Date.today} was successfully created.", @response.body
  end

  test "should update expense amount" do
    assert_difference 'Expense.count', 0 do
      patch expense_url(@expense), params: { expense: { amount: 11.1} }, xhr: true
    end
    assert_response :success
    assert_match "Expense was successfully edited.", @response.body
    assert_equal 11.1, Expense.last.amount
  end

  test "should update expense category" do
    patch expense_url(@expense), params: { expense: {category: 1 } }, xhr: true
    assert_response :success
    assert_equal "MyString", Expense.last.category.name
  end

  test "should update expense concept" do
    patch expense_url(@expense), params: { expense: { concept: "Edited concept" } }, xhr: true
    assert_response :success
    assert_equal "Edited concept", Expense.last.concept
  end

  test "should update expense date" do
    patch expense_url(@expense), params: { expense: { date: Date.today } }, xhr: true
    assert_response :success
    assert_equal Date.today, Expense.last.date
  end

  test "should update expense type" do
    patch expense_url(@expense), params: { expense: { type:1 } }, xhr: true
    assert_response :success
    assert_equal "MyString", Expense.last.type.name
  end

  test "should destroy expense" do
    assert_difference('Expense.count', -1) do
      delete expense_url(@expense)
    end
    assert_response :found
    assert_redirected_to expenses_url
    assert_equal "The #{@expense.type.name} #{@expense.concept} for #{@expense.amount} on #{@expense.date} was successfully delete.", flash[:notice]
  end
end
