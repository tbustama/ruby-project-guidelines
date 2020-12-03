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

ActiveRecord::Schema.define(version: 2020_12_02_193304) do

  create_table "favorite_teams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "city"
    t.string "name"
    t.integer "score"
    t.integer "opponent_score"
    t.string "time_of_possession"
    t.integer "first_downs"
    t.integer "penalties"
    t.integer "fumbles"
    t.integer "fumbles_forced"
    t.integer "passing_touchdowns"
    t.integer "rushing_touchdowns"
    t.integer "sacks"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "city"
    t.string "motto"
  end

end
