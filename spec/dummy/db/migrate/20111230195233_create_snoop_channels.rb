class CreateSnoopChannels < ActiveRecord::Migration
  def change

    create_table :snoop_channels do |t|
      t.string   "name"
      t.integer  "owner_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "owner_type"
    end

    add_index "snoop_channels", ["owner_id", "owner_type"], :name => "index_snoop_channels_on_owner_id_and_owner_type"

  end
end
