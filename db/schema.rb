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

ActiveRecord::Schema.define(version: 20170315152028) do

  create_table "comments", force: :cascade do |t|
    t.string   "content",    null: false
    t.integer  "movie_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_comments_on_movie_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "content",    null: false
    t.integer  "comment_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_conversations_on_comment_id"
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "movie_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_likes_on_movie_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "Title"
    t.string   "Year"
    t.string   "Plot"
    t.string   "Actors"
    t.string   "Rated"
    t.string   "Released"
    t.string   "Runtime"
    t.string   "Genre"
    t.string   "Director"
    t.string   "Writer"
    t.string   "Language"
    t.string   "Country"
    t.string   "Awards"
    t.string   "Poster"
    t.string   "Metascore"
    t.string   "imdbRating"
    t.string   "imdbVotes"
    t.string   "imdbID"
    t.string   "Type"
    t.string   "Response"
    t.string   "totalSeasons"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["imdbID"], name: "index_movies_on_imdbID"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "watchlists", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.string   "imdbID",      null: false
    t.string   "movie_title", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

end
