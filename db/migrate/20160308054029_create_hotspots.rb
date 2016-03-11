class CreateHotspots < ActiveRecord::Migration
  def change
    create_table :hotspots do |t|
      t.string :issue_type
      t.string :location
      t.datetime :occurred_time
      t.string :details
      t.integer :report_num
      t.boolean :to_share
      t.string :creator_name
      t.string :creator_email
      t.string :creator_number

      t.timestamps null: false
    end
  end
end
