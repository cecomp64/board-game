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

ActiveRecord::Schema.define(version: 20150827054315) do

  create_table "geographies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "helpers", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "helpers_modifier_instances", id: false, force: :cascade do |t|
    t.integer "helper_id",            null: false
    t.integer "modifier_instance_id", null: false
  end

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

  create_table "quests", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "space_id"
    t.string   "modifier_id"
    t.integer  "roll",               default: 4
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
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
