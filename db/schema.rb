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

ActiveRecord::Schema.define(version: 20151218234230) do

  create_table "clients", force: :cascade do |t|
    t.string   "first_name",      limit: 50, null: false
    t.string   "last_name",       limit: 50, null: false
    t.string   "document_number", limit: 10, null: false
    t.integer  "gender",                     null: false
    t.date     "birthday",                   null: false
    t.string   "cuilt",           limit: 15, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "client_id",              null: false
    t.string   "value",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "kind"
  end

  add_index "contacts", ["client_id"], name: "index_contacts_on_client_id"

  create_table "invoices", force: :cascade do |t|
    t.integer  "client_id",                                          null: false
    t.integer  "person_id",                                          null: false
    t.string   "description",   limit: 255,                          null: false
    t.decimal  "amount",                    precision: 12, scale: 2, null: false
    t.date     "emission_date",                                      null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id"
  add_index "invoices", ["person_id"], name: "index_invoices_on_person_id"

  create_table "people", force: :cascade do |t|
    t.string   "name",       limit: 50, null: false
    t.string   "cuilt",      limit: 15, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
