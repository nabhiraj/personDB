# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_25_162619) do
  create_table "educations", force: :cascade do |t|
    t.string "degree"
    t.string "description"
    t.string "specialisation"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "currently_studing"
    t.string "institute_info"
    t.string "city"
    t.integer "marks_scored"
    t.integer "marks_total"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_educations_on_person_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.boolean "self_employed"
    t.string "discription"
    t.string "industry"
    t.string "tittle"
    t.string "employer_info"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "currently_employed"
    t.string "city"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_jobs_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "gotr"
    t.decimal "height"
    t.decimal "weight"
    t.string "skin_color"
    t.string "hair_color"
    t.boolean "handicap", default: false, null: false
    t.boolean "cronic_disease", default: false, null: false
    t.boolean "married", default: false, null: false
    t.string "gender"
    t.datetime "date_of_birth"
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "points", force: :cascade do |t|
    t.string "info"
    t.integer "critical_level"
    t.string "commentable_type"
    t.integer "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_points_on_commentable"
  end

  create_table "relatives", force: :cascade do |t|
    t.integer "person_1_id"
    t.integer "person_2_id"
    t.string "relation_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_1_id"], name: "index_relatives_on_person_1_id"
    t.index ["person_2_id"], name: "index_relatives_on_person_2_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
end
