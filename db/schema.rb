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

ActiveRecord::Schema.define(version: 2019_04_19_191027) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "codes", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dicomfiles", force: :cascade do |t|
    t.string "filename"
    t.string "uploader"
    t.boolean "paid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_dicomfiles_on_user_id"
  end

  create_table "rxforms", force: :cascade do |t|
    t.text "doctor"
    t.integer "case"
    t.text "address"
    t.text "phone"
    t.text "patient"
    t.boolean "toothSupportedGuide"
    t.boolean "tissueLevelGuide"
    t.boolean "boneReductionGuide"
    t.boolean "hasStl"
    t.boolean "maxillary"
    t.boolean "mandibular"
    t.integer "numberOfImplants"
    t.integer "anchorPins"
    t.text "implantLocations"
    t.text "implantSystem"
    t.text "guidedSurgerySystem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "serviceType"
    t.string "comment"
    t.boolean "boneLevelGuide"
    t.index ["user_id"], name: "index_rxforms_on_user_id"
  end

  create_table "stlfiles", force: :cascade do |t|
    t.string "filename"
    t.string "uploader"
    t.boolean "paid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_stlfiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone_number"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cart_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
  end

end
