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

ActiveRecord::Schema.define(version: 20170408232118) do

  create_table "children", force: :cascade do |t|
    t.integer  "parent_id",            default: 0,     null: false
    t.string   "name",                 default: "",    null: false
    t.boolean  "frozen?",              default: false, null: false
    t.integer  "balance",              default: 0,     null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "childPin",   limit: 5, default: ""
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "chores", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "coins",                     default: 0,     null: false
    t.string   "name",                                      null: false
    t.text     "description"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "parent_id"
    t.boolean  "needs_approval",            default: false
    t.integer  "repeat_type",               default: 0
    t.integer  "repeat_data",    limit: 31, default: 0
    t.datetime "due_date"
    t.boolean  "completed",                 default: false
    t.datetime "repeat_until"
    t.integer  "group_id"
    t.index ["child_id"], name: "index_chores_on_child_id"
    t.index ["parent_id"], name: "index_chores_on_parent_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string   "email",                            default: "",     null: false
    t.string   "encrypted_password",               default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "pincode",                limit: 5, default: "0000"
    t.index ["email"], name: "index_parents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_parents_on_reset_password_token", unique: true
  end

  create_table "repeat_infos", force: :cascade do |t|
    t.integer  "repeat_type"
    t.integer  "repeat_data"
    t.integer  "chore_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["chore_id"], name: "index_repeat_infos_on_chore_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.integer  "cost",          default: 0,     null: false
    t.boolean  "auto_approve?", default: false, null: false
    t.integer  "parent_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "name"
    t.integer  "child_id"
    t.boolean  "redeemed",      default: false
    t.index ["child_id"], name: "index_rewards_on_child_id"
    t.index ["parent_id"], name: "index_rewards_on_parent_id"
  end

end
