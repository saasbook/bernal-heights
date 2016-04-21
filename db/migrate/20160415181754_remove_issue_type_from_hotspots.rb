class RemoveIssueTypeFromHotspots < ActiveRecord::Migration
  def change
    remove_column :hotspots, :issue_type, :string
  end
end
