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

ActiveRecord::Schema.define(version: 2022_05_28_072436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "name_url"
    t.string "image"
    t.string "image_url"
    t.string "cover_artist"
    t.string "cover_artist_url"
    t.string "interior"
    t.string "interior_url"
    t.string "narrator"
    t.string "narrator_url"
    t.string "publisher"
    t.string "publisher_url"
    t.datetime "release_date"
    t.string "release_date_url"
    t.integer "pages"
    t.string "pages_url"
    t.string "followed_by"
    t.string "followed_by_url"
    t.string "preceded_by"
    t.string "preceded_by_url"
    t.string "author"
    t.string "author_url"
    t.string "character_index_url"
    t.string "base_type"
    t.string "base_type_url"
  end

  create_table "wikis", force: :cascade do |t|
    t.string "title"
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "base_ype"
  end

end
