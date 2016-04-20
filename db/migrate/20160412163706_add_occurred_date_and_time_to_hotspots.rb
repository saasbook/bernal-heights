class AddOccurredDateAndTimeToHotspots < ActiveRecord::Migration
  def change
    add_column :hotspots, :occurred_date, :date
    add_column :hotspots, :occurred_time, :time
  end
end
