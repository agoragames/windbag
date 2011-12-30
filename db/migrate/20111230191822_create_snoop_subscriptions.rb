class CreateSnoopSubscriptions < ActiveRecord::Migration
  def change
    create_table :snoop_subscriptions do |t|
      t.integer  "user_id"
      t.integer  "snoop_channel_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.timestamps
    end

    add_index "snoop_subscriptions", ["snoop_channel_id"], :name => "snoop_chan_subs_on_snoop_chan_id"
    add_index "snoop_subscriptions", ["user_id"], :name => "index_snoop_subscriptions_on_user_id"
  end
end
