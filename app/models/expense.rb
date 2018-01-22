# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  tipo        :integer
#  date        :date
#  concept     :string
#  category    :integer
#  amount      :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Expense < ApplicationRecord
  belongs_to :category
  validates :tipo, :date, :concept, :amount, presence: true
  enum tipo: [:purchase, :withdrawal, :transfer, :payment]
end
