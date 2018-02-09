# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
restaurants = Category.create(name: "Restaurants")
gocery = Category.create(name: "Gocery")
car = Category.create(name: "Car")
services = Category.create(name: "Services")
home = Category.create(name: "Home")
edication = Category.create(name: "Education")
fun = Category.create(name: "Fun")
travel = Category.create(name: "Travel")

purchase = Type.create(name: "Purchase")
withdrawal = Type.create(name: "Withdrawal")
transfer = Type.create(name: "Transfer")
payment = Type.create(name: "Payment")


200.times do
  Expense.create( date: Faker::Date.between(365.days.ago, Date.today), concept: Faker::Lorem.sentence, amount: Faker::Number.decimal(5, 1), category_id:
Faker::Number.between(1, 8), type_id: Faker::Number.between(1, 4))
end
