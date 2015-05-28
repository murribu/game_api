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

ActiveRecord::Schema.define(version: 20150528130423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connect_instance_option_values", force: :cascade do |t|
    t.integer "connect_option_id",   null: false
    t.integer "connect_instance_id", null: false
    t.string  "value"
  end

  add_index "connect_instance_option_values", ["connect_instance_id"], name: "index_connect_instance_option_values_on_connect_instance_id", using: :btree
  add_index "connect_instance_option_values", ["connect_option_id"], name: "index_connect_instance_option_values_on_connect_option_id", using: :btree

  create_table "connect_instance_state_bits", force: :cascade do |t|
    t.integer "connect_instance_id", null: false
    t.integer "x"
    t.integer "y"
    t.integer "z"
    t.integer "connect_player_id"
  end

  add_index "connect_instance_state_bits", ["connect_instance_id"], name: "index_connect_instance_state_bits_on_connect_instance_id", using: :btree

  create_table "connect_instances", force: :cascade do |t|
    t.integer "user_id", null: false
  end

  add_index "connect_instances", ["user_id"], name: "index_connect_instances_on_user_id", using: :btree

  create_table "connect_option_values", force: :cascade do |t|
    t.integer "connect_option_id", null: false
    t.string  "value",             null: false
    t.boolean "is_default"
  end

  add_index "connect_option_values", ["connect_option_id"], name: "index_connect_option_values_on_connect_option_id", using: :btree

  create_table "connect_options", force: :cascade do |t|
    t.string "name",        default: "", null: false
    t.string "option_type",              null: false
  end

  create_table "connect_players", force: :cascade do |t|
    t.integer "connect_instance_id", null: false
    t.string  "name"
    t.boolean "winner"
  end

  add_index "connect_players", ["connect_instance_id"], name: "index_connect_players_on_connect_instance_id", using: :btree

  create_table "guessing_game_instance_option_values", force: :cascade do |t|
    t.integer  "guessing_game_instance_id",     null: false
    t.integer  "guessing_game_option_value_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guessing_game_instance_option_values", ["guessing_game_instance_id"], name: "index_guessing_game_instance_option_values_to_instance", using: :btree
  add_index "guessing_game_instance_option_values", ["guessing_game_option_value_id"], name: "index_guessing_game_instance_option_values_to_option_values", using: :btree

  create_table "guessing_game_instances", force: :cascade do |t|
    t.integer  "guessing_game_id", null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answer"
    t.boolean  "active"
  end

  add_index "guessing_game_instances", ["guessing_game_id"], name: "index_guessing_game_instances_on_guessing_game_id", using: :btree
  add_index "guessing_game_instances", ["user_id"], name: "index_guessing_game_instances_on_user_id", using: :btree

  create_table "guessing_game_option_values", force: :cascade do |t|
    t.integer  "guessing_game_option_id", null: false
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_default"
  end

  add_index "guessing_game_option_values", ["guessing_game_option_id"], name: "index_guessing_game_option_values_on_guessing_game_option_id", using: :btree

  create_table "guessing_game_options", force: :cascade do |t|
    t.integer  "guessing_game_id", null: false
    t.string   "name"
    t.string   "option_type",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guessing_game_options", ["guessing_game_id"], name: "index_guessing_game_options_on_guessing_game_id", using: :btree

  create_table "guessing_games", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "oauth_application_id", null: false
    t.string   "token",                null: false
    t.string   "scope"
    t.datetime "expires_at"
    t.datetime "revoked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_access_tokens", ["oauth_application_id"], name: "index_oauth_access_tokens_on_oauth_application_id", using: :btree
  add_index "oauth_access_tokens", ["user_id"], name: "index_oauth_access_tokens_on_user_id", using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "secret",       null: false
    t.string   "redirect_uri", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "twitter_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
