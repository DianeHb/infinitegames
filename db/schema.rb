# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_01_135923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.string "status", default: "pending"
    t.bigint "friend1_id"
    t.bigint "friend2_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend1_id"], name: "index_friendships_on_friend1_id"
    t.index ["friend2_id"], name: "index_friendships_on_friend2_id"
  end

  create_table "game_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_game_categories_on_category_id"
    t.index ["game_id"], name: "index_game_categories_on_game_id"
  end

  create_table "game_mechanics", force: :cascade do |t|
    t.bigint "mechanic_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_mechanics_on_game_id"
    t.index ["mechanic_id"], name: "index_game_mechanics_on_mechanic_id"
  end

  create_table "game_session_players", force: :cascade do |t|
    t.bigint "game_session_id", null: false
    t.string "player_type"
    t.bigint "player_id"
    t.boolean "winner", default: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_session_id"], name: "index_game_session_players_on_game_session_id"
    t.index ["player_type", "player_id"], name: "index_game_session_players_on_player_type_and_player_id"
  end

  create_table "game_sessions", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.date "date"
    t.bigint "user_id", null: false
    t.integer "duration"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_sessions_on_game_id"
    t.index ["user_id"], name: "index_game_sessions_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "min_players"
    t.integer "max_players"
    t.integer "min_age"
    t.integer "min_playtime"
    t.integer "max_playtime"
    t.string "editor"
    t.string "creators"
    t.float "rating_general"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_guests_on_user_id"
  end

  create_table "library_games", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "owner_id"
    t.boolean "borrowed", default: false
    t.string "borrower_type"
    t.bigint "borrower_id"
    t.date "borrowed_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["borrower_type", "borrower_id"], name: "index_library_games_on_borrower_type_and_borrower_id"
    t.index ["game_id"], name: "index_library_games_on_game_id"
    t.index ["owner_id"], name: "index_library_games_on_owner_id"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "text"
    t.bigint "game_id", null: false
    t.bigint "user_id", null: false
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_reviews_on_game_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "last_name"
    t.string "first_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friendships", "users", column: "friend1_id"
  add_foreign_key "friendships", "users", column: "friend2_id"
  add_foreign_key "game_categories", "categories"
  add_foreign_key "game_categories", "games"
  add_foreign_key "game_mechanics", "games"
  add_foreign_key "game_mechanics", "mechanics"
  add_foreign_key "game_session_players", "game_sessions"
  add_foreign_key "game_sessions", "games"
  add_foreign_key "game_sessions", "users"
  add_foreign_key "guests", "users"
  add_foreign_key "library_games", "games"
  add_foreign_key "library_games", "users", column: "owner_id"
  add_foreign_key "reviews", "games"
  add_foreign_key "reviews", "users"
end
