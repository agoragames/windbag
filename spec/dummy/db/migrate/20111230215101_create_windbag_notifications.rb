class CreateWindbagSubscriptions < ActiveRecord::Migration
  def change
    create_table :windbag_notifications do |t|
      t.string   "event"
      t.string   "title"
      t.text     "description"
      t.string   "url"
      t.string   "icon"
      t.boolean  "sticky",                  :default => false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "transports"
      t.integer  "channel_id"
    end

    add_index "windbag_notifications", ["channel_id"], :name => "index_windbag_notifications_on_channel_id"
  end
end
