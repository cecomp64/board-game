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

ActiveRecord::Schema.define(version: 20150830022000) do

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.integer  "winner_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "turn",              default: 0
    t.integer  "current_player_id"
  end

  create_table "games_players", id: false, force: :cascade do |t|
    t.integer "game_id",   null: false
    t.integer "player_id", null: false
  end

  add_index "games_players", ["game_id", "player_id"], name: "index_games_players_on_game_id_and_player_id"

  create_table "geographies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "color"
  end

  create_table "helper_discard_piles", force: :cascade do |t|
    t.integer "game_id"
    t.integer "helper_id"
  end

  add_index "helper_discard_piles", ["game_id", "helper_id"], name: "index_helper_discard_piles_on_game_id_and_helper_id"

  create_table "helpers", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "geography_id"
    t.integer  "points",             default: 3
  end

  create_table "helpers_modifier_instances", id: false, force: :cascade do |t|
    t.integer "helper_id",            null: false
    t.integer "modifier_instance_id", null: false
  end

  create_table "helpers_players", id: false, force: :cascade do |t|
    t.integer "helper_id", null: false
    t.integer "player_id", null: false
  end

  add_index "helpers_players", ["player_id", "helper_id"], name: "index_helpers_players_on_player_id_and_helper_id"

  create_table "helpers_tags", id: false, force: :cascade do |t|
    t.integer "helper_id", null: false
    t.integer "tag_id",    null: false
  end

  create_table "modifier_instances", force: :cascade do |t|
    t.integer  "geography_id"
    t.integer  "space_id"
    t.integer  "modifier_id"
    t.integer  "character_id", default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "name"
  end

  create_table "modifier_instances_players", id: false, force: :cascade do |t|
    t.integer "modifier_instance_id", null: false
    t.integer "player_id",            null: false
  end

  create_table "modifier_instances_quests", id: false, force: :cascade do |t|
    t.integer "modifier_instance_id", null: false
    t.integer "quest_id",             null: false
  end

  create_table "modifier_instances_tags", id: false, force: :cascade do |t|
    t.integer "modifier_instance_id", null: false
    t.integer "tag_id",               null: false
  end

  create_table "modifiers", force: :cascade do |t|
    t.string   "name"
    t.integer  "roll",           default: 0
    t.integer  "draw",           default: 0
    t.integer  "move",           default: 0
    t.integer  "turn",           default: 0
    t.integer  "banked_turns",   default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "move_other",     default: 0
    t.integer  "draw_other",     default: 0
    t.integer  "draw_other_all", default: 0
  end

  create_table "modifiers_tags", id: false, force: :cascade do |t|
    t.integer "modifier_id", null: false
    t.integer "tag_id",      null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer "character_id"
    t.integer "quest_id"
    t.integer "space_id"
    t.integer "points"
    t.string  "name"
  end

  create_table "quest_discard_piles", force: :cascade do |t|
    t.integer "game_id"
    t.integer "quest_id"
  end

  add_index "quest_discard_piles", ["game_id", "quest_id"], name: "index_quest_discard_piles_on_game_id_and_quest_id"

  create_table "quests", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "modifier_id"
    t.integer  "roll",               default: 4
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "points",             default: 10
    t.integer  "geography_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string   "name"
    t.integer  "geography_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
