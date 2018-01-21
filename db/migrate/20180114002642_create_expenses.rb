class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.integer :tipo
      t.date :date
      t.string :concept
      t.integer :category
      t.decimal :amount

      t.timestamps
    end
  end
end
