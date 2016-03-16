class CreateFavoriteRelations < ActiveRecord::Migration
  def change
    create_table :favorite_relations do |t|
      t.references :micropost, index: true
      t.references :user, index: true

      t.timestamps null: false
      t.index [:micropost_id, :user_id], unique: true
    end
  end
end
