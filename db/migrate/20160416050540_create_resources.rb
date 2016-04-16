class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :description
      t.string :phone
      t.string :link
      t.integer :kind

      t.timestamps null: false
    end
  end
end
