class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :resources, :type, :kind
  end
end
