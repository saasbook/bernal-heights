class AddTypeToResources < ActiveRecord::Migration
  def change
    add_column :resources, :type, :integer
  end
end
