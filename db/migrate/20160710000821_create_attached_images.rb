class CreateAttachedImages < ActiveRecord::Migration[5.0]
  def change
    create_table :attached_images do |t|
      t.string :url
      t.string :caption

      t.timestamps
    end
  end
end
