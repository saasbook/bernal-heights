class RemoveOccurredTimeFromHotspots < ActiveRecord::Migration
  def change
    remove_column :hotspots, :occurred_time, :datetime
  end
end
