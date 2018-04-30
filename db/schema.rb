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

ActiveRecord::Schema.define(version: 20180430022507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string "article_name"
    t.string "article_url"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_announcements_on_organization_id"
  end

  create_table "events", force: :cascade do |t|
    t.text "event_name"
    t.datetime "date"
    t.string "event_url"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_events_on_organization_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "organization_id"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_images_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "employee_count"
    t.integer "tech_team_size"
    t.text "address"
    t.string "website_url"
    t.string "twitter"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "tech_stacks", force: :cascade do |t|
    t.bigint "technology_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_tech_stacks_on_organization_id"
    t.index ["technology_id"], name: "index_tech_stacks_on_technology_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "approved"
    t.integer "permission_type", default: 1
    t.string "password_digest"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_creator"
    t.index ["organization_id"], name: "index_users_on_organization_id"
  end

  add_foreign_key "announcements", "organizations"
  add_foreign_key "events", "organizations"
  add_foreign_key "images", "organizations"
  add_foreign_key "tech_stacks", "organizations"
  add_foreign_key "tech_stacks", "technologies"
  add_foreign_key "users", "organizations"
end
