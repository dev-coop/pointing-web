class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.timestamp :last_geocoded_at
      t.string :description
      t.string :status
      t.text :comments

      t.timestamps null: false
    end
  end
end
