class CreateFavorResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :favor_responses do |t|
      t.references :favor, foreign_key: true
      t.references :user, foreign_key: true
      t.text :comment
      t.boolean :accepted
      t.datetime :can_help_at

      t.timestamps
    end
  end
end
