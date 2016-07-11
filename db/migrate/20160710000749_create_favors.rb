class CreateFavors < ActiveRecord::Migration[5.0]
  def change
    create_table :favors do |t|
      t.references :user, index: { name: 'index_favor_on_user_id' }
      t.string :title
      t.text :message
      t.string :favor_type

      t.timestamps
    end
  end
end
