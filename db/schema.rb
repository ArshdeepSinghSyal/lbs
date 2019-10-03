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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_10_01_063046) do
=======
ActiveRecord::Schema.define(version: 2019_10_03_025105) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
>>>>>>> master

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "lib_book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lib_book_id"], name: "index_bookmarks_on_lib_book_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "language"
    t.date "published"
    t.float "edition"
    t.binary "image"
    t.string "subject"
    t.text "summary"
    t.boolean "is_special_collection_item"
    t.string "author"
    t.string "isbn"
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
  end

  create_table "lib_books", force: :cascade do |t|
    t.integer "library_id"
    t.integer "book_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_lib_books_on_book_id"
    t.index ["library_id"], name: "index_lib_books_on_library_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.integer "university_id"
    t.string "location"
    t.string "name"
    t.integer "max_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fine"
    t.index ["university_id"], name: "index_libraries_on_university_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "lib_book_id"
    t.integer "user_id"
    t.integer "status"
    t.datetime "checkoutstamp"
    t.datetime "returnstamp"
    t.datetime "requeststamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lib_book_id"], name: "index_reservations_on_lib_book_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ug_books_limit"
    t.integer "grad_books_limit"
    t.integer "phd_books_limit"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "usertype"
    t.integer "is_approved"
    t.integer "university_id"
    t.string "name"
    t.integer "library_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["university_id"], name: "index_users_on_university_id"
  end

  create_table "usertypes", force: :cascade do |t|
    t.string "usertype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
