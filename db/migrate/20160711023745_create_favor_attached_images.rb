class CreateFavorAttachedImages < ActiveRecord::Migration[5.0]
  def change
    create_table :favor_attached_images do |t|
      t.references :favor
      t.references :attached_image

      t.timestamps
    end
  end
end
