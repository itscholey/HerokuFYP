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

ActiveRecord::Schema.define(version: 20170413144117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actionitemassignees", force: :cascade do |t|
    t.integer  "actionitem_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "actionitemassignees", ["actionitem_id"], name: "index_actionitemassignees_on_actionitem_id", using: :btree
  add_index "actionitemassignees", ["user_id"], name: "index_actionitemassignees_on_user_id", using: :btree

  create_table "actionitems", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "actionplan_id"
    t.datetime "target_completion_date"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "completed",              default: false
  end

  add_index "actionitems", ["actionplan_id"], name: "index_actionitems_on_actionplan_id", using: :btree

  create_table "actionplans", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "student_id"
    t.integer  "supervisor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "assignments", ["role_id"], name: "index_assignments_on_role_id", using: :btree
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id", using: :btree

  create_table "attendees", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendees", ["meeting_id"], name: "index_attendees_on_meeting_id", using: :btree
  add_index "attendees", ["user_id"], name: "index_attendees_on_user_id", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrolments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enrolments", ["subject_id"], name: "index_enrolments_on_subject_id", using: :btree
  add_index "enrolments", ["user_id"], name: "student", using: :btree

  create_table "hellos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inboxes", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "message_id"
    t.boolean  "read",         default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "inboxes", ["message_id"], name: "index_inboxes_on_message_id", using: :btree
  add_index "inboxes", ["recipient_id"], name: "index_inboxes_on_recipient_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.integer  "subject_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "lesson_work"
  end

  add_index "lessons", ["subject_id"], name: "index_lessons_on_subject_id", using: :btree

  create_table "meetings", force: :cascade do |t|
    t.string   "subject"
    t.datetime "date"
    t.string   "location"
    t.string   "agenda"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.string   "body"
    t.integer  "recipient_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["recipient_id"], name: "sender", using: :btree

  create_table "recipients", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "recipients", ["conversation_id"], name: "index_recipients_on_conversation_id", using: :btree
  add_index "recipients", ["user_id"], name: "index_recipients_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.string   "classGroup"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subjects", ["user_id"], name: "teacher", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "work_logs", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "lesson_id"
    t.datetime "date"
    t.integer  "time_spent"
    t.boolean  "in_school"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  add_index "work_logs", ["lesson_id"], name: "index_work_logs_on_lesson_id", using: :btree

  add_foreign_key "actionitemassignees", "actionitems"
  add_foreign_key "actionitemassignees", "users"
  add_foreign_key "actionitems", "actionplans"
  add_foreign_key "actionplans", "users", column: "student_id"
  add_foreign_key "actionplans", "users", column: "supervisor_id"
  add_foreign_key "assignments", "roles", on_delete: :cascade
  add_foreign_key "assignments", "users", on_delete: :cascade
  add_foreign_key "attendees", "meetings", on_delete: :cascade
  add_foreign_key "attendees", "users", on_delete: :cascade
  add_foreign_key "enrolments", "subjects", on_delete: :cascade
  add_foreign_key "enrolments", "users", on_delete: :cascade
  add_foreign_key "inboxes", "messages", on_delete: :cascade
  add_foreign_key "inboxes", "recipients", on_delete: :cascade
  add_foreign_key "lessons", "subjects", on_delete: :cascade
  add_foreign_key "messages", "conversations", on_delete: :cascade
  add_foreign_key "messages", "recipients", on_delete: :cascade
  add_foreign_key "recipients", "conversations", on_delete: :cascade
  add_foreign_key "recipients", "users", on_delete: :cascade
  add_foreign_key "subjects", "users"
  add_foreign_key "work_logs", "lessons"
  add_foreign_key "work_logs", "users", column: "student_id"
end
