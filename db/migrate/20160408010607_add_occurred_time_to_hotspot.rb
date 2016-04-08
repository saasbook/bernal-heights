class AddOccurredTimeToHotspot < ActiveRecord::Migration
  def change
    add_column :hotspots, :time, :time
  end
end
