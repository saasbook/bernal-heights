class AddRegionToHotspots < ActiveRecord::Migration
  def change
    add_column :hotspots, :region, :string
  end
end
