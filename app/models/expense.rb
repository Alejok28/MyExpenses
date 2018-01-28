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

  scope :by_category, ->(category) { where("category_id like ?", "%#{category}%") }
  scope :by_type, ->(type) { where("type_id like ?", "%#{type}%") }
  scope :by_month, ->(date) { where(date: "#{date}-01".to_date.."#{date}-01".to_date.end_of_month) }
end
