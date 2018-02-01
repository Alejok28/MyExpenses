# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  date        :date
#  concept     :string
#  amount      :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  type_id     :integer
#

require 'test_helper'

# VALIDATIONS
class ExpenseTest < ActiveSupport::TestCase
  test "Expenses should have a date" do
    expense = Expense.new(concept:'Concept', amount:2000.023, category_id:1, type_id:1)
    assert_not expense.save
  end
  test "Expenses should have a concept" do
    expense = Expense.new(date:Date.today, amount:2000.023, category_id:1, type_id:1)
    assert_not expense.save
  end
  test "Expenses should have a amount" do
    expense = Expense.new(date:Date.today, concept:'Concept', category_id:1, type_id:1)
    assert_not expense.save
  end
  test "Expenses should have a category" do
    expense = Expense.new(date:Date.today, amount:2000.023, concept:'Concept', type_id:1)
    assert_not expense.save
  end
  test "Expenses should have a type" do
    expense = Expense.new(date:Date.today, amount:2000.023, concept:'Concept', type_id:1)
    assert_not expense.save
  end

  # SCOPES
  test "by_category scope only returns Expenses with that category" do
    expenses = Expense.by_category(1)
    assert_equal 1, expenses.length
  end
  test "by_type scope only returns Expenses with that type" do
    expenses = Expense.by_type(1)
    assert_equal 1, expenses.length
  end


end
