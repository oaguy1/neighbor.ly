class CreateUserLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_locations do |t|
      t.references :user
      t.references :location

      t.timestamps
    end
  end
end
