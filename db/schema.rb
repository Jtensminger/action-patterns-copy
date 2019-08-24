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

ActiveRecord::Schema.define(version: 20190822230543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alternatives", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "decision_space_id"
    t.index ["decision_space_id"], name: "index_alternatives_on_decision_space_id"
  end

  create_table "criteria", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "decision_space_id"
    t.index ["decision_space_id"], name: "index_criteria_on_decision_space_id"
  end

  create_table "decision_spaces", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_decision_spaces_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "frame"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "decision_space_id"
    t.index ["decision_space_id"], name: "index_goals_on_decision_space_id"
  end

  create_table "judgements", force: :cascade do |t|
    t.float "preference"
    t.bigint "scale_type"
    t.bigint "user_id"
    t.bigint "pairwise_comparison_id"
    t.bigint "decision_space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["decision_space_id"], name: "index_judgements_on_decision_space_id"
    t.index ["pairwise_comparison_id"], name: "index_judgements_on_pairwise_comparison_id"
    t.index ["scale_type"], name: "index_judgements_on_scale_type"
    t.index ["user_id"], name: "index_judgements_on_user_id"
  end

  create_table "pairwise_comparisons", force: :cascade do |t|
    t.bigint "goal_id"
    t.bigint "control_node_type"
    t.bigint "control_node_id"
    t.bigint "subordinate_nodes_type"
    t.bigint "subordinate_node_one_id"
    t.bigint "subordinate_node_two_id"
    t.bigint "decision_space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["control_node_type"], name: "index_pairwise_comparisons_on_control_node_type"
    t.index ["decision_space_id"], name: "index_pairwise_comparisons_on_decision_space_id"
    t.index ["subordinate_nodes_type"], name: "index_pairwise_comparisons_on_subordinate_nodes_type"
  end

  create_table "sub_criteria", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "criterium_id"
    t.bigint "decision_space_id"
    t.index ["criterium_id"], name: "index_sub_criteria_on_criterium_id"
    t.index ["decision_space_id"], name: "index_sub_criteria_on_decision_space_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "decision_spaces", "users"
  add_foreign_key "judgements", "decision_spaces"
  add_foreign_key "judgements", "pairwise_comparisons"
  add_foreign_key "judgements", "users"
  add_foreign_key "pairwise_comparisons", "decision_spaces"
end
