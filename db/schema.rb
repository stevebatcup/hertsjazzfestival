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

ActiveRecord::Schema.define(version: 20200124093255) do

  create_table "days", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date    "date"
    t.integer "festival_id"
    t.decimal "day_standard_price",       precision: 8, scale: 2
    t.decimal "day_members_price",        precision: 8, scale: 2
    t.decimal "day_students_price",       precision: 8, scale: 2
    t.decimal "earlybird_standard_price", precision: 8, scale: 2
    t.decimal "earlybird_members_price",  precision: 8, scale: 2
    t.decimal "earlybird_students_price", precision: 8, scale: 2
    t.integer "sort"
    t.string  "booking_url"
  end

  create_table "festivals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "year"
    t.integer  "venue_id"
    t.string   "gallery_url"
    t.boolean  "is_current",                                                     default: false
    t.decimal  "weekend_standard_price",                 precision: 8, scale: 2
    t.decimal  "weekend_members_price",                  precision: 8, scale: 2
    t.decimal  "weekend_students_price",                 precision: 8, scale: 2
    t.decimal  "earlybird_standard_price",               precision: 8, scale: 2
    t.decimal  "earlybird_members_price",                precision: 8, scale: 2
    t.decimal  "earlybird_students_price",               precision: 8, scale: 2
    t.string   "booking_url"
    t.datetime "created_at",                                                                     null: false
    t.datetime "updated_at",                                                                     null: false
    t.datetime "starts"
    t.datetime "ends"
    t.date     "early_bird_cutoff_date"
    t.text     "meta_description",         limit: 65535
  end

  create_table "gigs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "act"
    t.integer  "day_id"
    t.text     "description",    limit: 65535
    t.string   "image"
    t.string   "website"
    t.string   "booking_url"
    t.string   "video_url"
    t.integer  "sort"
    t.decimal  "standard_price",               precision: 8, scale: 2
    t.decimal  "members_price",                precision: 8, scale: 2
    t.decimal  "students_price",               precision: 8, scale: 2
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
    t.time     "starts"
    t.time     "ends"
    t.boolean  "is_film",                                              default: false
  end

  create_table "instruments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "shorthand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments_musicians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "instrument_id"
    t.integer "musician_id"
  end

  create_table "musicians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "gig_id"
    t.integer "musician_id"
    t.integer "instrument_id"
  end

  create_table "site_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "value"
  end

  create_table "venues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "address",    limit: 65535
    t.string   "phone"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
