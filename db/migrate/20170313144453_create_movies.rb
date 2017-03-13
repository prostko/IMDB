class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :plot, null: false
      t.string :actors, null: false
      t.string :title
      t.string :rated
      t.string :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :writer
      t.string :actors
      t.string :plot
      t.string :language
      t.string :country
      t.string :awards
      t.string :poster
      t.string :metascore
      t.string :imdb_rating
      t.string :imdb_votes
      t.string :imdb_id, unique: true, index: true
      t.string :type
      t.string :response

      t.timestamps
    end
  end
end
