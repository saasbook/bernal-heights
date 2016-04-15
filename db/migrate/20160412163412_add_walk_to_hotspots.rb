class AddWalkToHotspots < ActiveRecord::Migration
  def change
    add_column :hotspots, :walk, :boolean
  end
end
