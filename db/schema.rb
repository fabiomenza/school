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

ActiveRecord::Schema.define(version: 20140628151101) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  add_index "admins", ["username"], name: "index_admins_on_username", unique: true

  create_table "alumnis", force: true do |t|
    t.string   "name"
    t.integer  "year"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "awards", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bureaucracies", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "regulation_id"
    t.integer  "cost_id"
    t.integer  "bursary_id"
  end

  create_table "bursaries", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bureaucracy_id"
  end

  create_table "classrooms", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "how_to_get_there"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "costs", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bureaucracy_id"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "program"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "classroom_id"
    t.date     "accademic_year"
  end

  add_index "courses", ["teacher_id"], name: "index_courses_on_teacher_id"

  create_table "courses_curriculums", force: true do |t|
    t.integer "curriculum_id"
    t.integer "course_id"
  end

  create_table "courses_exams", force: true do |t|
    t.integer "course_id"
    t.integer "exam_id"
  end

  create_table "courses_materials", force: true do |t|
    t.integer "course_id"
    t.integer "material_id"
  end

  create_table "curriculums", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "work_opportunity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.time     "time"
    t.integer  "structure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "get_involved"
    t.integer  "event_type_id"
  end

  add_index "events", ["structure_id"], name: "index_events_on_structure_id"

  create_table "exams", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.time     "time"
    t.integer  "course_id"
    t.integer  "classroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exams", ["classroom_id"], name: "index_exams_on_classroom_id"
  add_index "exams", ["course_id"], name: "index_exams_on_course_id"

  create_table "histories", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homes", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "how_to_get_theres", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lectures", force: true do |t|
    t.string   "w_day"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  create_table "materials", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "multimedia_url"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["course_id"], name: "index_materials_on_course_id"

  create_table "missions", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.time     "time"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news", ["course_id"], name: "index_news_on_course_id"

  create_table "photos", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "structure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["structure_id"], name: "index_photos_on_structure_id"

  create_table "regulations", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bureaucracy_id"
  end

  create_table "service_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "structure_id"
    t.integer  "classroom_id"
    t.integer  "service_type_id"
    t.text     "reference"
  end

  create_table "structure_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "structures", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "map"
    t.integer  "structure_type_id"
  end

  create_table "teachers", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.text     "bio"
    t.string   "photo_url"
    t.text     "curriculum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
