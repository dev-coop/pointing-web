class AddElevationToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :elevation, :float
  end
end
