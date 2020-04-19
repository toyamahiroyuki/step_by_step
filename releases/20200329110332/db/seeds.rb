# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
  User.create!(name: "大阪#{i + 1}", email: "t#{i + 1}@test", old: "#{i + 20}", sex: "男性", job: "営業", deposit: "100", member: "#{i + 1}", password: "password", password_confirmation: "password")
end

Income.create!(user_id: "1", day: "2020-03-03", income: 200000, income_item: "給料")
Income.create!(user_id: "1", day: "2020-03-20", income: 10000, income_item: "手当て")
ProportialCost.create!(user_id: "1", day: "2020-03-01", proportial_cost: 5000, proportial_cost_item: "食費")
ProportialCost.create!(user_id: "1", day: "2020-03-21", proportial_cost: 6000, proportial_cost_item: "交際費")
FixedCost.create!(user_id: 1, rent: 20000, insurance: 10000, fixed_costs_other: 5000)
Lifeline.create!(user_id: 1, electron: 2000, gass: 1000, water: 1500)
Loan.create!(fixed_cost_id: 1, loan_purpose: "住宅ローン", loan_cost: 100000)
Target.create!(user_id: 1, target_purpose: "海外旅行", target_cost: 200000)
Communication.create!(fixed_cost_id: 1, phone: 5000, wi_fi: 2000, communications_other: 500)
Tax.create!(fixed_cost_id: 1, health: 10000, pension: 10000, resident: 5000, taxes_other: 3000)
