class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :description
      t.string :link
      t.string :phone

      t.timestamps null: false
    end
  end
end
