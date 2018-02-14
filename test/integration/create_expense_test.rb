require 'test_helper'

class CreateExpenseTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  # 
  # test "create an expense" do
  #   visit expenses_path
  #   get new_expense_url, xhr: true
  #   # fill_in('expense[date]', with: Date.today )
  #   fill_in('concept', with: 'PUREBA')
  #   fill_in('Amount', with: '1234567')
  #   click_b('New Expense')
  # end
end
