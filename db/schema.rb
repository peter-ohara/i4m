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

ActiveRecord::Schema.define(version: 20170430182550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_of_ghana_rates", force: :cascade do |t|
    t.integer  "discount_rate_91_days"
    t.integer  "interest_rate_91_days"
    t.integer  "discount_rate_182_days"
    t.integer  "interest_rate_182_days"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "next_of_kins", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_next_of_kins_on_user_id", using: :btree
  end

  create_table "purchased_t_bills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "principal_pesewas"
    t.integer  "tenure"
    t.integer  "bank_of_ghana_rate_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["bank_of_ghana_rate_id"], name: "index_purchased_t_bills_on_bank_of_ghana_rate_id", using: :btree
    t.index ["user_id"], name: "index_purchased_t_bills_on_user_id", using: :btree
  end

  create_table "saved_t_bills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "principal_pesewas"
    t.integer  "tenure"
    t.integer  "bank_of_ghana_rate_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["bank_of_ghana_rate_id"], name: "index_saved_t_bills_on_bank_of_ghana_rate_id", using: :btree
    t.index ["user_id"], name: "index_saved_t_bills_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "purchased_t_bills", "bank_of_ghana_rates"
  add_foreign_key "purchased_t_bills", "users"
  add_foreign_key "saved_t_bills", "bank_of_ghana_rates"
  add_foreign_key "saved_t_bills", "users"
end
