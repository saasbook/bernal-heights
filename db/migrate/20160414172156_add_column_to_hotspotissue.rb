class AddColumnToHotspotissue < ActiveRecord::Migration
  def change
    add_column :hotspotissues, :hotspot_id, :integer
    add_column :hotspotissues, :issue_id, :integer
  end
end
