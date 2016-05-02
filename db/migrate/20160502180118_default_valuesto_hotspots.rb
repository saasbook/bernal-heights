class DefaultValuestoHotspots < ActiveRecord::Migration
  def change
    change_column_default :hotspots, :walk, default: false
    change_column_default :hotspots, :to_share, default: false
  end
end
