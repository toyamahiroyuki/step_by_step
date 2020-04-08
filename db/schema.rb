# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_16_112735) do

  create_table "balances", force: :cascade do |t|
    t.integer "user_id"
    t.string "balance_purpose"
    t.integer "balance_cost"
    t.integer "balance_by_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communications", force: :cascade do |t|
    t.integer "fixed_cost_id"
    t.integer "phone"
    t.integer "wi_fi"
    t.integer "communications_other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fixed_costs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "rent", default: 0
    t.integer "insurance", default: 0
    t.integer "fixed_costs_other", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.integer "user_id"
    t.integer "goal"
    t.integer "transportation"
    t.integer "food"
    t.integer "entertainment"
    t.integer "daily"
    t.integer "gass"
    t.integer "electron"
    t.integer "water"
    t.integer "goals_other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.integer "user_id"
    t.date "day"
    t.integer "income"
    t.integer "income_item"
    t.string "income_memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lifelines", force: :cascade do |t|
    t.integer "user_id"
    t.integer "electron", default: 0
    t.integer "gass", default: 0
    t.integer "water", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_items", force: :cascade do |t|
    t.integer "loan_id"
    t.integer "loan_by_month"
    t.integer "loan_balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loans", force: :cascade do |t|
    t.integer "fixed_cost_id"
    t.string "loan_purpose"
    t.integer "loan_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "moving_cost"
    t.integer "distance"
    t.integer "family"
    t.integer "season"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proportial_costs", force: :cascade do |t|
    t.integer "user_id"
    t.date "day"
    t.integer "proportial_cost"
    t.integer "proportial_cost_item"
    t.string "proportial_cost_memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "target_items", force: :cascade do |t|
    t.integer "target_id"
    t.integer "target_by_month"
    t.integer "target_balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "targets", force: :cascade do |t|
    t.integer "user_id"
    t.string "target_purpose"
    t.integer "target_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.integer "fixed_cost_id"
    t.integer "health"
    t.integer "pension"
    t.integer "resident"
    t.integer "taxes_other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "profile_image_id"
    t.integer "old"
    t.integer "sex"
    t.integer "job"
    t.integer "deposit"
    t.integer "member"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
