class DefaultValuestoHotspots < ActiveRecord::Migration
  def change
    change_column_default :hotspots, :walk, false
    change_column_default :hotspots, :to_share, false
  end
end
