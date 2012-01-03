class CreateWindbagSubscriptions < ActiveRecord::Migration
  def change
    create_table :windbag_subscriptions do |t|
      t.integer  "user_id"
      t.integer  "channel_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.timestamps
    end

    add_index "windbag_subscriptions", ["channel_id"], :name => "windbag_subs_on_chan_id"
    add_index "windbag_subscriptions", ["user_id"], :name => "index_windbag_subscriptions_on_user_id"
  end
end
