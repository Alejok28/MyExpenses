require "application_system_test_case"

class ExpensesTest < ApplicationSystemTestCase
	test 'create a new expense' do
		visit expenses_path
		click_on 'New Expense'
		fill_in 'expense_concept', with: 'Test concept'
		fill_in 'expense_date', with: '12-03-2018'
		click_on 'Create Expense'

	  assert_current_path expenses_path
		assert_selector '#notice', text: 'The Purchase Test concept for $0.0 on 2018-03-12 was successfully created.'
	end

end
