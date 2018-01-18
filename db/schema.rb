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

ActiveRecord::Schema.define(version: 20180108140347) do

  create_table "BX-Books", id: :string, limit: 13, default: "", collation: "utf8_bin", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "author"
    t.integer "year", unsigned: true
    t.string "publisher"
    t.string "Image-URL-S", collation: "utf8_bin"
    t.string "Image-URL-M", collation: "utf8_bin"
    t.string "Image-URL-L", collation: "utf8_bin"
    t.decimal "price", precision: 10
  end

  create_table "book_stores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books_book_stores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "id_book"
    t.string "id_book_store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "read_books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "read_date"
  end

  create_table "wishlists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "book_id"
    t.boolean "read_or_not"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
