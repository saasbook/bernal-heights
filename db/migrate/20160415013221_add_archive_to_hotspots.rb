class AddArchiveToHotspots < ActiveRecord::Migration
  def change
    add_column :hotspots, :archive, :boolean, default: false
  end
end
