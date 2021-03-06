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

ActiveRecord::Schema.define(:version => 20130628204216) do

  create_table "accounts", :force => true do |t|
    t.string   "role",                   :default => "admin", :null => false
    t.string   "email",                  :default => "",      :null => false
    t.string   "encrypted_password",     :default => "",      :null => false
    t.string   "first_name",             :default => "",      :null => false
    t.string   "last_name",              :default => "",      :null => false
    t.integer  "current_deck_id",        :default => 1
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "last_access_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "accounts", ["authentication_token"], :name => "index_accounts_on_authentication_token", :unique => true
  add_index "accounts", ["confirmation_token"], :name => "index_accounts_on_confirmation_token", :unique => true
  add_index "accounts", ["email"], :name => "index_accounts_on_email", :unique => true
  add_index "accounts", ["reset_password_token"], :name => "index_accounts_on_reset_password_token", :unique => true
  add_index "accounts", ["unlock_token"], :name => "index_accounts_on_unlock_token", :unique => true

  create_table "decks", :force => true do |t|
    t.string   "title"
    t.integer  "account_id"
    t.integer  "current_flashcard_id", :default => 1
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "flashcards", :force => true do |t|
    t.string   "front"
    t.string   "back"
    t.integer  "deck_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "flashcards", ["deck_id"], :name => "index_flashcards_on_deck_id"

  create_table "identities", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "url"
    t.string   "location"
    t.string   "locale"
    t.string   "time_zone"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "identities", ["account_id"], :name => "index_identities_on_account_id"
  add_index "identities", ["provider", "account_id"], :name => "index_identities_on_provider_and_account_id", :unique => true
  add_index "identities", ["provider", "uid"], :name => "index_identities_on_provider_and_uid", :unique => true

end
