module ExpensesHelper
  def self.last_twelve_months
    (0..11).map do |i|
      "#{i.month.ago.year}-#{i.month.ago.month}"
    end
  end
end
