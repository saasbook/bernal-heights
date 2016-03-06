class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.string :location
      t.text :description
      t.string :creator_name
      t.string :creator_email
      t.string :event_organizer

      t.timestamps null: false
    end
  end
end
