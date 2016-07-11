class CreateFavorLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :favor_locations do |t|
      t.references :favor
      t.references :location

      t.timestamps
    end
  end
end
