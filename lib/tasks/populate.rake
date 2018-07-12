namespace :populate do
  desc "Populates database every day"
  task daily_expenses: :environment do
    Expense.create(
      date: Date.today, 
      concept: Faker::Lorem.sentence,
      amount: Faker::Number.decimal(5, 1),
      category_id: Faker::Number.between(1, 8),
      type_id: Faker::Number.between(1, 4)
    )
  end
end
