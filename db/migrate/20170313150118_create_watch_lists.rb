class CreateWatchLists < ActiveRecord::Migration[5.0]
  def change
    create_table :watchlists do |t|
      t.references :user, null: false
      t.string :imdbID, null: false
      t.string :movie_title, null: false

      t.timestamps
    end
  end
end
