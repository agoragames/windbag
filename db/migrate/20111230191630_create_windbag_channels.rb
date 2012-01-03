class CreateWindbagChannels < ActiveRecord::Migration
  def change

    create_table :windbag_channels do |t|
      t.string   "name"
      t.integer  "owner_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "owner_type"
    end

    add_index "windbag_channels", ["owner_id", "owner_type"], :name => "index_windbag_channels_on_owner_id_and_owner_type"

  end
end
