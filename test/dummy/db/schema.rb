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

ActiveRecord::Schema.define(:version => 20130319002645) do

  create_table "open_badges_alignments", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "open_badges_assertions", :force => true do |t|
    t.integer  "badge_id"
    t.string   "image"
    t.string   "evidence"
    t.datetime "expires"
    t.text     "identity"
    t.string   "identity_type"
    t.boolean  "identity_hashed"
    t.string   "identity_salt"
    t.string   "verification_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "open_badges_badge_alignments", :force => true do |t|
    t.integer  "badge_id"
    t.integer  "alignment_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "open_badges_badge_tags", :force => true do |t|
    t.integer  "badge_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "open_badges_badges", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "criteria"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "open_badges_organizations", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.string   "image"
    t.string   "email"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "open_badges_tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "open_badges_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "open_badges_users", ["email"], :name => "index_open_badges_users_on_email", :unique => true
  add_index "open_badges_users", ["reset_password_token"], :name => "index_open_badges_users_on_reset_password_token", :unique => true

end
