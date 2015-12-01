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

ActiveRecord::Schema.define(version: 20151201133756) do

  create_table "applies", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "task_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "state"
  end

  create_table "educations", force: :cascade do |t|
    t.integer  "stage",      limit: 4
    t.date     "time"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "educations", ["user_id"], name: "index_educations_on_user_id", using: :btree

  create_table "information", force: :cascade do |t|
    t.string   "birth_account",   limit: 255
    t.string   "qq",              limit: 255
    t.string   "email",           limit: 255
    t.string   "id_number",       limit: 255
    t.integer  "education",       limit: 4
    t.string   "graduate",        limit: 255
    t.date     "graduation_time"
    t.integer  "political",       limit: 4
    t.string   "hobbies",         limit: 255
    t.string   "specialty",       limit: 255
    t.string   "language",        limit: 255
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "information", ["user_id"], name: "index_information_on_user_id", using: :btree

  create_table "internships", force: :cascade do |t|
    t.string   "company",     limit: 255
    t.string   "position",    limit: 255
    t.string   "performance", limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "internships", ["user_id"], name: "index_internships_on_user_id", using: :btree

  create_table "levels", force: :cascade do |t|
    t.integer  "figure",         limit: 4
    t.integer  "communicate",    limit: 4
    t.integer  "coordination",   limit: 4
    t.integer  "control",        limit: 4
    t.integer  "decision",       limit: 4
    t.integer  "p_figure",       limit: 4
    t.integer  "p_communicate",  limit: 4
    t.integer  "p_coordination", limit: 4
    t.integer  "p_control",      limit: 4
    t.integer  "p_decision",     limit: 4
    t.integer  "theoretical",    limit: 4
    t.integer  "practical",      limit: 4
    t.integer  "grade",          limit: 4
    t.integer  "title",          limit: 4
    t.integer  "qualification",  limit: 4
    t.integer  "identity",       limit: 4
    t.datetime "deadline"
    t.integer  "put_time",       limit: 4
    t.integer  "get_time",       limit: 4
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "levels", ["user_id"], name: "index_levels_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "mobile",     limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "options", force: :cascade do |t|
    t.text     "a",           limit: 65535
    t.text     "b",           limit: 65535
    t.text     "c",           limit: 65535
    t.text     "d",           limit: 65535
    t.text     "e",           limit: 65535
    t.text     "f",           limit: 65535
    t.integer  "question_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "problem",    limit: 65535
    t.integer  "level",      limit: 4
    t.integer  "power",      limit: 4
    t.integer  "genre",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "answer",     limit: 4
  end

  add_index "questions", ["genre"], name: "index_questions_on_genre", using: :btree
  add_index "questions", ["level"], name: "index_questions_on_level", using: :btree
  add_index "questions", ["power"], name: "index_questions_on_power", using: :btree

  create_table "score_caches", force: :cascade do |t|
    t.integer  "power",      limit: 4, default: 1
    t.integer  "level",      limit: 4, default: 1
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "score_caches", ["user_id"], name: "index_score_caches_on_user_id", using: :btree

  create_table "scores", force: :cascade do |t|
    t.integer  "surface",     limit: 4, default: 0
    t.integer  "communicate", limit: 4, default: 0
    t.integer  "decision",    limit: 4, default: 0
    t.integer  "cooperate",   limit: 4, default: 0
    t.integer  "control",     limit: 4, default: 0
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "scores", ["user_id"], name: "index_scores_on_user_id", using: :btree

  create_table "task_types", force: :cascade do |t|
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "figure",         limit: 4
    t.integer  "communicate",    limit: 4
    t.integer  "coordination",   limit: 4
    t.integer  "control",        limit: 4
    t.integer  "decision",       limit: 4
    t.integer  "p_figure",       limit: 4
    t.integer  "p_communicate",  limit: 4
    t.integer  "p_coordination", limit: 4
    t.integer  "p_control",      limit: 4
    t.integer  "p_decision",     limit: 4
    t.integer  "grade",          limit: 4
    t.string   "name",           limit: 255
    t.integer  "state",          limit: 4
    t.datetime "deadline"
    t.integer  "range",          limit: 4
    t.integer  "coin",           limit: 4
    t.text     "describe",       limit: 65535
    t.text     "goal",           limit: 65535
    t.text     "extra",          limit: 65535
    t.string   "place",          limit: 255
    t.integer  "user_id",        limit: 4
    t.integer  "task_type_id",   limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "tab",            limit: 255
  end

  add_index "tasks", ["task_type_id"], name: "index_tasks_on_task_type_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "number",                 limit: 4
    t.string   "nickname",               limit: 255
    t.string   "name",                   limit: 255
    t.string   "nation",                 limit: 255
    t.integer  "gender",                 limit: 4
    t.string   "phone",                  limit: 255
    t.string   "native",                 limit: 255
    t.string   "present",                limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "works", force: :cascade do |t|
    t.string   "company",    limit: 255
    t.date     "start_time"
    t.date     "end_time"
    t.string   "position",   limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "works", ["user_id"], name: "index_works_on_user_id", using: :btree

  add_foreign_key "educations", "users"
  add_foreign_key "information", "users"
  add_foreign_key "internships", "users"
  add_foreign_key "levels", "users"
  add_foreign_key "options", "questions"
  add_foreign_key "score_caches", "users"
  add_foreign_key "scores", "users"
  add_foreign_key "tasks", "task_types"
  add_foreign_key "tasks", "users"
  add_foreign_key "works", "users"
end
