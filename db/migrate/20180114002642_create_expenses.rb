class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.date :date
      t.string :concept
      t.decimal :amount

      t.timestamps
    end
  end
end
