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

class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :type
  validates :type_id, :category_id, :date, :concept, :amount, presence: true
  validates :amount, numericality: true

  scope :by_category, ->(category) { where("category_id like ?", "%#{category}%") }
  scope :by_type, ->(type) { where("type_id like ?", "%#{type}%") }
  scope :by_month, ->(date) { where(date: "#{date}-01".to_date.."#{date}-01".to_date.end_of_month) }

  def self.categories
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
  end

  def self.last_six_months
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
    by_month
  end

  def self.daily
    daily = []
    d = Time.now.day
    m = Time.now.month
    y = Time.now.year

    (0...d).each do |i|
      daily[i] = {expense: Expense.where(date:("#{y}-#{m}-#{d-i}")).sum(:amount), day: d-i}
    end
    daily
  end

  def self.accumulated
    last_m = 1.month.ago.month
    last_y = 1.month.ago.year
    accumulated_actual = 0
    accumulated_last = 0
    total = []

    (1..Time.now.end_of_month.day).each do |i|
      accumulated_actual += Expense.where(date:("#{Time.now.year}-#{Time.now.month}-#{i}")).sum(:amount)
      accumulated_last += Expense.where(date:("#{last_y}-#{last_m}-#{i}")).sum(:amount)
      total[i-1] = {last: accumulated_last , actual: accumulated_actual,  day:i}
    end
    total
  end

end
