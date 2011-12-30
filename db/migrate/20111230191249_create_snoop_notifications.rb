class CreateSnoopNotifications < ActiveRecord::Migration
  def change
    create_table :snoop_notifications do |t|
      t.string   "event"
      t.string   "title"
      t.text     "description"
      t.string   "url"
      t.string   "icon"
      t.boolean  "sticky",                  :default => false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "transports"
      t.integer  "snoop_channel_id"
    end

    add_index "snoop_notifications", 
      ["snoop_channel_id"], 
      :name => "index_snoop_notifications_on_snoop_channel_id"
  end
end
