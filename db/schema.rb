# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130626005832) do

  create_table "blogs", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.string   "title"
    t.datetime "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "position"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "phone"
    t.string   "email"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "google_reviews"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.date     "expiration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faq_translations", :force => true do |t|
    t.integer  "faq_id"
    t.string   "locale"
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faq_translations", ["faq_id"], :name => "index_faq_translations_on_faq_id"
  add_index "faq_translations", ["locale"], :name => "index_faq_translations_on_locale"

  create_table "faqs", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logos", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.boolean  "default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_post_translations", :force => true do |t|
    t.integer  "monthly_post_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "monthly_post_translations", ["locale"], :name => "index_monthly_post_translations_on_locale"
  add_index "monthly_post_translations", ["monthly_post_id"], :name => "index_87196191470b76e0770f926136b5c22f03249988"

  create_table "monthly_posts", :force => true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_header_translations", :force => true do |t|
    t.integer  "page_header_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_header_translations", ["locale"], :name => "index_page_header_translations_on_locale"
  add_index "page_header_translations", ["page_header_id"], :name => "index_page_header_translations_on_page_header_id"

  create_table "page_headers", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.float    "price"
    t.text     "description"
    t.integer  "category_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"

  create_table "review_translations", :force => true do |t|
    t.integer  "review_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "review_translations", ["locale"], :name => "index_review_translations_on_locale"
  add_index "review_translations", ["review_id"], :name => "index_review_translations_on_review_id"

  create_table "reviews", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "phone"
    t.boolean  "active"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
