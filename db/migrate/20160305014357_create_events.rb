class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.name :string
      t.location :string
      t.date :date
      t.time :time
      t.description :text
      t.host :string

      t.timestamps null: false
    end
  end
end
