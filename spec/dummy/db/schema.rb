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

ActiveRecord::Schema.define(:version => 20111230215103) do

  create_table "users", :force => true do |t|
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "windbag_channels", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "owner_type"
  end

  add_index "windbag_channels", ["owner_id", "owner_type"], :name => "index_windbag_channels_on_owner_id_and_owner_type"

  create_table "windbag_notifications", :force => true do |t|
    t.string   "event"
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.string   "icon"
    t.boolean  "sticky",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "transports"
    t.integer  "channel_id"
  end

  add_index "windbag_notifications", ["channel_id"], :name => "index_windbag_notifications_on_channel_id"

  create_table "windbag_subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "channel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "windbag_subscriptions", ["channel_id"], :name => "windbag_subs_on_chan_id"
  add_index "windbag_subscriptions", ["user_id"], :name => "index_windbag_subscriptions_on_user_id"

end
