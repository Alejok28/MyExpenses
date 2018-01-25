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

  scope :by_category, ->(cat) { where("category_id like ?", cat) }
  scope :by_type, ->(typ) { where("type_id like ?", typ) }
end
