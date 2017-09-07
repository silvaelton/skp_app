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

ActiveRecord::Schema.define(version: 20170830140627) do

  create_table "indirect_team_awards", force: :cascade do |t|
    t.integer "context_id"
    t.float "percent"
    t.integer "quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manager_criterions", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
    t.integer "store_id"
    t.integer "context_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manager_evaluation_categories", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
    t.integer "context_id"
    t.float "minimum_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manager_evaluation_criterions", force: :cascade do |t|
    t.integer "evaluation_id"
    t.integer "criterion_id"
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manager_evaluations", force: :cascade do |t|
    t.integer "staff_id"
    t.float "score"
    t.text "observation"
    t.integer "context_id"
    t.date "date"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_context_hit_objectives", force: :cascade do |t|
    t.integer "context_id"
    t.integer "objective_id"
    t.text "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_context_objectives", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: true
    t.float "score"
    t.integer "context_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_contexts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "store_id"
    t.date "started_at"
    t.date "ended_at"
    t.boolean "status", default: true
    t.text "manager_ids"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_goals", force: :cascade do |t|
    t.integer "context_id"
    t.string "name"
    t.text "description"
    t.float "minimum_value"
    t.float "goal_value"
    t.float "exceed_minimum_percent"
    t.float "exceed_goal_percent"
    t.float "fixed_exceed_goal_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_staff_scores", force: :cascade do |t|
    t.integer "staff_id"
    t.integer "goal_id"
    t.float "score_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_staffs", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.integer "job", default: 0
    t.integer "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "telephone"
    t.string "address"
    t.string "address_complement"
    t.string "address_number"
    t.string "neighborhood"
    t.string "city"
    t.string "uf"
    t.string "cep"
    t.boolean "status", default: true
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "store_id"
    t.string "name"
    t.string "email"
    t.string "password"
    t.boolean "status", default: true
    t.integer "privilege", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
