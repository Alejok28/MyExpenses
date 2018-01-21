# == Schema Information
#
# Table name: expenses
#
#  id         :integer          not null, primary key
#  tipo       :integer
#  date       :date
#  concept    :string
#  category   :integer
#  amount     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Expense < ApplicationRecord
  enum tipo: [:purchase, :withdrawal, :transfer, :payment]
  enum category: [:restaurants, :grocery, :car, :services, :home, :education, :fun, :travel]

end
