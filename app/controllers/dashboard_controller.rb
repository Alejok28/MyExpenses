class DashboardController < ApplicationController
  def index
    @tab = :dashboard
    @today = Expense.where("date = ?", Date.today).sum(:amount)
    @yesterday = Expense.where("date = ?", Date.yesterday).sum(:amount)
    @this_month = Expense.where(date: Time.now.beginning_of_month..Time.now.end_of_month).sum(:amount)
    @last_month = Expense.where(date: (Time.now.beginning_of_month - 1.month)..(Time.now.end_of_month-1.month)).sum(:amount)
  end

  def category
    by_category = Expense.categories
    render json: by_category
  end

  def last_six_months
    by_month = Expense.last_six_months
    render json: by_month
  end

  def by_day
    daily = Expense.daily
    render json: daily
  end

  def accumulated
    total = Expense.accumulated
    render json: total
  end

end
