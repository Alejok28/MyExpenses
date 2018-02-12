class DashboardController < ApplicationController
  def index
    @tab = :dashboard
    @today = Expense.where("date = ?", Date.today)
    @yesterday = Expense.where("date = ?", Date.yesterday)
    @this_month = Expense.where(date: Time.now.beginning_of_month..Time.now.end_of_month)
    @last_month = Expense.where(date: (Time.now.beginning_of_month - 1.month)..(Time.now.end_of_month-1.month))
  end

  def category
    expenses = Expense.where(date: Time.now.beginning_of_month..Time.now.end_of_month)
    cat1 = cat2 = cat3 = cat4 = cat5 = cat6 = cat7 = cat8 = 0
    expenses.each do |expense|
      if expense.category_id == 1
        cat1 += expense.amount
      elsif expense.category_id == 2
        cat2 += expense.amount
      elsif expense.category_id == 3
        cat3 += expense.amount
      elsif expense.category_id == 4
        cat4 += expense.amount
      elsif expense.category_id == 5
        cat5 += expense.amount
      elsif expense.category_id == 6
        cat6 += expense.amount
      elsif expense.category_id == 7
        cat7 += expense.amount
      elsif expense.category_id == 8
        cat8 += expense.amount
      end
    end
    by_category = [[1,cat1], [2, cat2], [3, cat3], [4, cat4], [5, cat5], [6, cat6], [7, cat7], [8, cat8]]

    render json: by_category
  end

  def last_six_months
    by_month = []
    6.times do |i|
      type1 = type2 = type3 = type4 = 0
      month = (Time.now.beginning_of_month - i.month).strftime("%b-%Y")
      monthly_expenses = Expense.where(date:(Time.now.beginning_of_month - i.month)..(Time.now.end_of_month-i.month))

      monthly_expenses.each do |expense|
        if expense.type_id == 1
          type1 += expense.amount
        elsif expense.type_id == 2
          type2 += expense.amount
        elsif expense.type_id == 3
          type3 += expense.amount
        elsif expense.type_id == 4
          type4 += expense.amount
        end
      end

      by_month[i] = { purchase: type1, withdrawal: type2, transfer: type3, payment: type4, month: month }
    end
    render json: by_month
  end
end
