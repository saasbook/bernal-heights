class HotspotStatus < ActiveRecord::Migration
  def up
    add_column :hotspots, :status, :string
  end
  
  def down
    remove_column :hotspots, :status
  end
end
