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

ActiveRecord::Schema.define(version: 2024_11_21_182955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "physician_id", null: false
    t.string "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["physician_id"], name: "index_appointments_on_physician_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "book_artists", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "artist_id", null: false
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_book_artists_on_artist_id"
    t.index ["book_id"], name: "index_book_artists_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
    t.string "image_url"
    t.string "publisher"
    t.string "publisher_url"
    t.datetime "release_date"
    t.string "release_date_url"
    t.integer "pages"
    t.string "followed_by"
    t.string "followed_by_url"
    t.string "preceded_by"
    t.string "preceded_by_url"
    t.string "character_index_url"
    t.string "base_type"
  end

  create_table "character_types", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "creature_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_types_on_character_id"
    t.index ["creature_type_id"], name: "index_character_types_on_creature_type_id"
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
    t.string "title"
    t.string "title_url"
    t.string "signature"
    t.string "signature_url"
    t.string "romances"
    t.string "romances_url"
    t.string "boggart"
    t.string "boggart_url"
    t.string "wand_url"
    t.string "patronus"
    t.string "patronus_url"
    t.string "job"
    t.string "job_url"
    t.string "house"
    t.string "house_url"
    t.string "height"
    t.string "animagus"
    t.string "animagus_url"
    t.string "feathers"
    t.string "feathers_url"
    t.string "hair_url"
    t.string "height_url"
    t.string "path"
    t.string "wand"
  end

  create_table "creature_types", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.string "eyes"
    t.string "hair"
    t.string "native"
    t.string "height"
    t.string "length"
    t.string "mortality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "distinctions", force: :cascade do |t|
    t.string "content"
    t.bigint "creature_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "record_type"
    t.bigint "record_id"
    t.index ["creature_type_id"], name: "index_distinctions_on_creature_type_id"
    t.index ["record_type", "record_id"], name: "index_distinctions_on_record"
  end

  create_table "heads", force: :cascade do |t|
    t.bigint "house_id", null: false
    t.bigint "header_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["header_id"], name: "index_heads_on_header_id"
    t.index ["house_id"], name: "index_heads_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.string "founder"
    t.string "founder_url"
    t.string "animal"
    t.string "animal_url"
    t.string "element"
    t.string "element_url"
    t.string "ghost"
    t.string "ghost_url"
    t.string "common_room"
    t.string "common_room_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url"
    t.string "image"
    t.string "colors"
    t.integer "members_count"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "house_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_members_on_character_id"
    t.index ["house_id"], name: "index_members_on_house_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "physicians", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "title"
    t.string "path"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable"
  end

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.boolean "published", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "related_creature_types", force: :cascade do |t|
    t.bigint "main_id"
    t.bigint "related_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["main_id"], name: "index_related_creature_types_on_main_id"
    t.index ["related_id"], name: "index_related_creature_types_on_related_id"
  end

  create_table "spells", force: :cascade do |t|
    t.string "image_url"
    t.string "name"
    t.string "incantation"
    t.string "kind"
    t.string "light"
    t.string "effect"
    t.string "base_type"
    t.string "hand_url"
    t.bigint "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_spells_on_creator_id"
  end

  create_table "wand_masters", force: :cascade do |t|
    t.bigint "wand_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_wand_masters_on_character_id"
    t.index ["wand_id"], name: "index_wand_masters_on_wand_id"
  end

  create_table "wand_owners", force: :cascade do |t|
    t.bigint "wand_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_wand_owners_on_character_id"
    t.index ["wand_id"], name: "index_wand_owners_on_wand_id"
  end

  create_table "wands", force: :cascade do |t|
    t.string "manufacturer"
    t.string "made"
    t.string "wood"
    t.string "core"
    t.string "length"
    t.string "characteristics"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "path"
    t.string "image"
    t.string "image_url"
    t.string "name"
    t.string "masters"
    t.string "masters_url"
    t.string "manufacturer_url"
  end

  create_table "wikis", force: :cascade do |t|
    t.string "title"
    t.string "path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "base_type"
  end

  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "physicians"
  add_foreign_key "book_artists", "artists"
  add_foreign_key "book_artists", "books"
  add_foreign_key "character_types", "characters"
  add_foreign_key "character_types", "creature_types"
  add_foreign_key "distinctions", "creature_types"
  add_foreign_key "heads", "characters", column: "header_id"
  add_foreign_key "heads", "houses"
  add_foreign_key "members", "characters"
  add_foreign_key "members", "houses"
  add_foreign_key "related_creature_types", "creature_types", column: "main_id"
  add_foreign_key "related_creature_types", "creature_types", column: "related_id"
  add_foreign_key "spells", "wikis", column: "creator_id"
  add_foreign_key "wand_masters", "characters"
  add_foreign_key "wand_masters", "wands"
  add_foreign_key "wand_owners", "characters"
  add_foreign_key "wand_owners", "wands"
end
