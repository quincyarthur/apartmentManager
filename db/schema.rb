# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160524144025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commercial_properties", force: :cascade do |t|
    t.integer  "landlord_id"
    t.integer  "category_id"
    t.integer  "island_id"
    t.string   "street_name"
    t.integer  "square_feet"
    t.decimal  "num_bathrooms"
    t.integer  "num_units"
    t.decimal  "monthly_amt"
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "islands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landlords", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.string   "phone_number"
    t.integer  "subscription_id"
    t.decimal  "balance",                default: 0.0
    t.boolean  "active",                 default: true
  end

  add_index "landlords", ["email"], name: "index_landlords_on_email", unique: true, using: :btree
  add_index "landlords", ["reset_password_token"], name: "index_landlords_on_reset_password_token", unique: true, using: :btree

  create_table "property_amenities", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "amenity_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "property_type"
  end

  create_table "prospective_tenants", force: :cascade do |t|
    t.integer  "property_id"
    t.string   "name"
    t.string   "phone_number"
    t.date     "appointment_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "property_type"
  end

  create_table "residential_properties", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "landlord_id"
    t.integer  "category_id"
    t.string   "street_name"
    t.integer  "num_bedrooms"
    t.decimal  "num_bathrooms"
    t.integer  "num_units"
    t.decimal  "monthly_amt"
    t.string   "description"
    t.integer  "island_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name"
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenant_payment_details", force: :cascade do |t|
    t.integer  "tenant_id"
    t.decimal  "payment_amount"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "tenant_rent_details", force: :cascade do |t|
    t.integer  "tenant_id"
    t.integer  "property_id"
    t.date     "rent_due_date"
    t.date     "lease_start_date"
    t.date     "lease_end_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "property_type"
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.decimal  "balance",                default: 0.0
  end

  add_index "tenants", ["email"], name: "index_tenants_on_email", unique: true, using: :btree
  add_index "tenants", ["reset_password_token"], name: "index_tenants_on_reset_password_token", unique: true, using: :btree

end
