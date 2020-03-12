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

  # Income.create!(user_id: "1", income: "50", income_item: "給料")
  # Income.create!(user_id: "1", income: "100", income_item: "給料")
  # Income.create!(user_id: "1", income: "150", income_item: "給料")

