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

ActiveRecord::Schema.define(version: 2022_05_28_084204) do

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

  create_table "characters", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.string "born"
    t.string "blood"
    t.string "marital"
    t.string "nationality"
    t.string "nickname"
    t.string "species"
    t.string "gender"
    t.string "weight"
    t.string "hair"
    t.string "eyes"
    t.string "skin"
    t.string "family"
    t.string "loyalty"
    t.string "base_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url"
    t.string "name_url"
    t.string "born_url"
    t.string "blood_url"
    t.string "marital_url"
    t.string "nationality_url"
    t.string "nickname_url"
    t.string "species_url"
    t.string "gender_url"
    t.string "weight_urlhair_url"
    t.string "eyes_url"
    t.string "skin_url"
    t.string "family_url"
    t.string "loyalty_url"
    t.string "base_type_url"
    t.string "died"
    t.string "died_url"
  end

  create_table "wikis", force: :cascade do |t|
    t.string "title"
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "base_type"
  end

end
