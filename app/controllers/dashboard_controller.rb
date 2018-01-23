class DashboardController < ApplicationController
  def index
    @tab = :dashboard
  end
  def last_six_months
    render json: Expense.group(:type_id).group_by_month_of_year(:amount).count
  end
end
