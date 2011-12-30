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

  create_table "snoop_channels", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "owner_type"
  end

  add_index "snoop_channels", ["owner_id", "owner_type"], :name => "index_snoop_channels_on_owner_id_and_owner_type"

  create_table "snoop_notifications", :force => true do |t|
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

  add_index "snoop_notifications", ["channel_id"], :name => "index_snoop_notifications_on_channel_id"

  create_table "snoop_subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "channel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "snoop_subscriptions", ["channel_id"], :name => "snoop_subs_on_chan_id"
  add_index "snoop_subscriptions", ["user_id"], :name => "index_snoop_subscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
