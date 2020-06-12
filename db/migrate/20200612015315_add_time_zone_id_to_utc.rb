class AddTimeZoneIdToUtc < ActiveRecord::Migration[5.2]
  def change
    add_column :utcs, :time_zone_id, :integer
    add_index :utcs, :time_zone_id
  end
end
