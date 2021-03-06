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

ActiveRecord::Schema.define(version: 20171121183317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "page_id"
    t.integer "user_id"
    t.string "message"
    t.string "visibility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insights", force: :cascade do |t|
    t.integer "site_id"
    t.integer "page_id"
    t.string "optimization_type"
    t.string "content"
    t.string "completion_status"
  end

  create_table "pages", force: :cascade do |t|
    t.integer "site_id"
    t.string "page_path"
    t.string "page_insight_status"
    t.float "text_to_html_ratio"
    t.integer "word_count"
    t.string "title"
    t.string "meta_desc"
    t.string "h1", array: true
    t.string "h2", array: true
    t.datetime "last_crawled"
    t.boolean "error_on_last_crawl"
    t.boolean "redirect_on_last_crawl"
    t.text "body_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "full_url"
    t.string "domain_name"
    t.string "protocol"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "last_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

end
