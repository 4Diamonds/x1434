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

ActiveRecord::Schema.define(:version => 20130817192713) do

  create_table "accounts", :force => true do |t|
    t.integer  "user_id"
    t.float    "cash"
    t.integer  "coins"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "accounts", ["user_id"], :name => "index_accounts_on_user_id"

  create_table "balances", :force => true do |t|
    t.integer  "account_id"
    t.string   "kind"
    t.string   "title"
    t.integer  "value"
    t.integer  "current_coins"
    t.float    "current_cash"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "balances", ["account_id"], :name => "index_balances_on_account_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug"

  create_table "clicks", :force => true do |t|
    t.integer  "page_id"
    t.integer  "user_id"
    t.integer  "value"
    t.string   "kind"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clicks", ["page_id"], :name => "index_clicks_on_page_id"
  add_index "clicks", ["user_id"], :name => "index_clicks_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["page_id"], :name => "index_comments_on_page_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "followers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "followers", ["page_id"], :name => "index_followers_on_page_id"
  add_index "followers", ["user_id"], :name => "index_followers_on_user_id"

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.boolean  "accept",     :default => false
    t.string   "token"
    t.string   "slug"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "invitations", ["slug"], :name => "index_invitations_on_slug"
  add_index "invitations", ["token"], :name => "index_invitations_on_token"
  add_index "invitations", ["user_id"], :name => "index_invitations_on_user_id"

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "package_id"
    t.string   "gateway"
    t.float    "value"
    t.boolean  "return"
    t.boolean  "paid",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "orders", ["package_id"], :name => "index_orders_on_package_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "packages", :force => true do |t|
    t.string   "cat"
    t.string   "title"
    t.integer  "coins"
    t.float    "cash"
    t.float    "value"
    t.boolean  "active",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "pages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "title"
    t.string   "url"
    t.integer  "value"
    t.string   "slug"
    t.string   "token"
    t.boolean  "published",   :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "pages", ["category_id"], :name => "index_pages_on_category_id"
  add_index "pages", ["slug"], :name => "index_pages_on_slug"
  add_index "pages", ["token"], :name => "index_pages_on_token"
  add_index "pages", ["user_id"], :name => "index_pages_on_user_id"

  create_table "rewards", :force => true do |t|
    t.integer  "user_id"
    t.string   "kind"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rewards", ["user_id"], :name => "index_rewards_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => "",   :null => false
    t.string   "email",                  :default => "",   :null => false
    t.string   "paypal_email",           :default => "",   :null => false
    t.string   "pagseguro_email",        :default => "",   :null => false
    t.boolean  "active",                 :default => true
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "withdraws", :force => true do |t|
    t.integer  "user_id"
    t.string   "gateway"
    t.float    "value"
    t.boolean  "paid",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "withdraws", ["user_id"], :name => "index_withdraws_on_user_id"

end
