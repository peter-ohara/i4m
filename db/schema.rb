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

ActiveRecord::Schema.define(version: 20170519162058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fixed_deposit_investments", force: :cascade do |t|
    t.integer  "institution_id"
    t.string   "name"
    t.integer  "period_in_days"
    t.integer  "minimum_principal_pesewas"
    t.integer  "risk_rating"
    t.text     "links"
    t.string   "email"
    t.string   "phone_number"
    t.text     "description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["institution_id"], name: "index_fixed_deposit_investments_on_institution_id", using: :btree
  end

  create_table "fixed_deposit_rates", force: :cascade do |t|
    t.integer  "fixed_deposit_investment_id"
    t.integer  "interest_rate"
    t.date     "effective_date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["fixed_deposit_investment_id"], name: "index_fixed_deposit_rates_on_fixed_deposit_investment_id", using: :btree
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "fixed_deposit_investments", "institutions"
  add_foreign_key "fixed_deposit_rates", "fixed_deposit_investments"
end
