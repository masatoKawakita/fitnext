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

ActiveRecord::Schema.define(version: 2019_08_19_020259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "trainer_evaluations", force: :cascade do |t|
    t.float "fun_rate", null: false
    t.float "understandable_rate", null: false
    t.float "politeness_rate", null: false
    t.float "kindness_rate", null: false
    t.float "passion_rate", null: false
    t.text "content", null: false
    t.bigint "user_id"
    t.bigint "trainer_id"
    t.index ["trainer_id"], name: "index_trainer_evaluations_on_trainer_id"
    t.index ["user_id"], name: "index_trainer_evaluations_on_user_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "license", null: false
    t.string "experience", null: false
    t.string "belongs", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name", limit: 100, null: false
    t.date "birthday", null: false
    t.integer "sex", null: false
    t.string "tel", null: false
    t.string "picture"
    t.string "address"
    t.text "infomation"
    t.string "skype"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trainer_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "trainer_evaluations", "trainers"
  add_foreign_key "trainer_evaluations", "users"
end
