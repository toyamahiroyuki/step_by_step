# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#テストuser
 User.create!(
      name: "testuser",
      email: "test@test.com",
      old: "20",
      sex: "男性",
      job: "営業",
      deposit: "1000000",
      member: "1",
      password: "testuser",
      password_confirmation: "testuser"
 )

#ダミーuser
5.times do |n|
  name = Faker::Name.first_name
  email = Faker::Internet.email
  password = "password#{n + 1}"
  old = Faker::Number.between(from: 20, to: 40)
  sex = Faker::Gender.binary_type
  job = Faker::Company.category
  deposit = 1000000 + (n * 200000)
  member = Faker::Number.between(from: 1, to: 5)
  User.create!(name: name,
               email: email,
               old: old,
               sex: sex,
               job: job,
               deposit: deposit,
               member: member,
               password: password,
               password_confirmation: password,
               )
 end

#userに紐つくfixed_costモデル
 User.all.each do |user|
  rent = Faker::Number.between(from: 1, to: 8)
  insurance = Faker::Number.between(from: 1, to: 5)
  fixed_costs_other = Faker::Number.between(from: 1, to: 3)
  user.create_fixed_cost!(
                          user_id: user.id,
                          rent: rent * 10000,
                          insurance: insurance * 5000,
                          fixed_costs_other: fixed_costs_other * 3000,
  )
 end

 #userに紐つくlifelineモデル
 User.all.each do |user|
  electron = Faker::Number.between(from: 1, to: 5)
  gass = Faker::Number.between(from: 1, to: 5)
  water = Faker::Number.between(from: 1, to: 3)
  user.create_lifeline!(
                          user_id: user.id,
                          electron: electron * 1000,
                          gass: gass * 1000,
                          water: water * 1000,
  )
 end

# User.create!(
#   [
#     {
#       name: "Mr.tanaka",
#       email: "tanaka@test.com",
#       old: "20",
#       sex: "男性",
#       job: "営業",
#       deposit: "1000000",
#       member: "1",
#       password: "password1",
#       password_confirmation: "password1"
#     },
#     {
#       name: "山本先生",
#       email: "yamamoto@test.com",
#       old: "30",
#       sex: "男性",
#       job: "先生",
#       deposit: "2000000",
#       member: "2",
#       password: "password2",
#       password_confirmation: "password2"
#     },
#     {
#       name: "ジャムおじさん",
#       email: "jam@test.com",
#       old: "25",
#       sex: "女性",
#       job: "パン屋",
#       deposit: "3000000",
#       member: "4",
#       password: "password3",
#       password_confirmation: "password"
#     },
#     {
#       name: "testuser",
#       email: "testuser@test",
#       old: "28",
#       sex: "男性",
#       job: "無職",
#       deposit: "500000",
#       member: "1",
#       password: "testuser",
#       password_confirmation: "testuser"
#     },
#   ]
# )

# Income.create!(
#   [
#     {
#       user_id: "1",
#       day: "2020-03-03",
#       income: 200000,
#       income_item: "給料"
#     },

#     }]

#   user_id: "1",day: "2020-03-03", income: 200000, income_item: "給料")
  # Income.create!(user_id: "1",day: "2020-03-20", income: 10000, income_item: "手当て")
  # ProportialCost.create!(user_id: "1",day: "2020-03-01", proportial_cost: 5000, proportial_cost_item: "食費")
  # ProportialCost.create!(user_id: "1",day: "2020-03-21", proportial_cost: 6000, proportial_cost_item: "交際費")
  # FixedCost.create!(user_id: 1, rent: 20000, insurance: 10000, fixed_costs_other: 5000)
  # Lifeline.create!(user_id: 1, electron: 2000, gass: 1000, water: 1500)
  # Loan.create!(fixed_cost_id: 1, loan_purpose: "住宅ローン", loan_cost: 100000)
  # Target.create!(user_id: 1, target_purpose: "海外旅行", target_cost: 200000)
  # Communication.create!(fixed_cost_id: 1, phone: 5000, wi_fi: 2000, communications_other: 500)
  # Tax.create!(fixed_cost_id: 1, health: 10000, pension: 10000, resident: 5000, taxes_other: 3000)