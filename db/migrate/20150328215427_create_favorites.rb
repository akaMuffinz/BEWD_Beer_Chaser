class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :beer_id
      t.string :name
    end
  end
end
