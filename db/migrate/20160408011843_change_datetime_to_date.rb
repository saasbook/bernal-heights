class ChangeDatetimeToDate < ActiveRecord::Migration
  def change
    change_column :hotspots, :occurred_time, :time
  end
end
