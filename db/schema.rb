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

ActiveRecord::Schema.define(version: 5) do

  create_table "characters", force: :cascade do |t|
    t.integer "movie_id"
    t.string  "name"
    t.string  "gender"
    t.boolean "is_human"
    t.boolean "dies_in_movie"
    t.string  "img_src"
  end

  create_table "movies", force: :cascade do |t|
    t.string  "name"
    t.integer "year"
    t.string  "poster_src"
    t.string  "description"
    t.integer "running_time"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
  end

end
