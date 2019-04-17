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

ActiveRecord::Schema.define(version: 2019_04_17_002629) do

  create_table "headquarters", force: :cascade do |t|
    t.integer "user_id"
    t.integer "city_vp"
    t.string "name"
    t.string "adress"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_headquarters_on_user_id"
  end

  create_table "phones", force: :cascade do |t|
    t.integer "headquarter_id"
    t.integer "brand_vp"
    t.integer "code"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["headquarter_id"], name: "index_phones_on_headquarter_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "user_id"
    t.integer "phone_id"
    t.decimal "price", precision: 15, scale: 10
    t.date "date"
    t.datetime "warranty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_id"], name: "index_purchases_on_phone_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "role_vp"
    t.integer "gender_vp"
    t.string "cc"
    t.string "string"
    t.string "name"
    t.string "address"
    t.string "email"
    t.string "password_digest"
    t.bigint "phone_number"
    t.date "date_of_birth"
    t.string "api_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
