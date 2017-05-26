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

ActiveRecord::Schema.define(version: 20170523223253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "fd_purchase_attempts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "fixed_deposit_investment_id"
    t.integer  "principal_pesewas"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["fixed_deposit_investment_id"], name: "index_fd_purchase_attempts_on_fixed_deposit_investment_id", using: :btree
    t.index ["user_id"], name: "index_fd_purchase_attempts_on_user_id", using: :btree
  end

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

  create_table "mutual_fund_purchase_attempts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "mutual_fund_id"
    t.integer  "principal_pesewas"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["mutual_fund_id"], name: "index_mutual_fund_purchase_attempts_on_mutual_fund_id", using: :btree
    t.index ["user_id"], name: "index_mutual_fund_purchase_attempts_on_user_id", using: :btree
  end

  create_table "mutual_fund_rates", force: :cascade do |t|
    t.integer  "mutual_fund_id"
    t.integer  "unit_price_pesewas"
    t.integer  "yield_to_date"
    t.date     "effective_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["mutual_fund_id"], name: "index_mutual_fund_rates_on_mutual_fund_id", using: :btree
  end

  create_table "mutual_funds", force: :cascade do |t|
    t.integer  "institution_id"
    t.string   "name"
    t.integer  "minimum_principal_pesewas"
    t.integer  "debit_order_pesewas"
    t.integer  "management_fee_rate"
    t.integer  "min_days_before_withdrawal"
    t.integer  "risk_rating"
    t.text     "links"
    t.string   "email"
    t.string   "phone_number"
    t.text     "description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["institution_id"], name: "index_mutual_funds_on_institution_id", using: :btree
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.string   "searchable_type"
    t.integer  "searchable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "fd_purchase_attempts", "fixed_deposit_investments"
  add_foreign_key "fd_purchase_attempts", "users"
  add_foreign_key "fixed_deposit_investments", "institutions"
  add_foreign_key "fixed_deposit_rates", "fixed_deposit_investments"
  add_foreign_key "mutual_fund_purchase_attempts", "mutual_funds"
  add_foreign_key "mutual_fund_purchase_attempts", "users"
  add_foreign_key "mutual_fund_rates", "mutual_funds"
  add_foreign_key "mutual_funds", "institutions"
end
