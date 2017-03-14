class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :Title, null: false
      t.string :Year
      t.string :Plot, null: false
      t.string :Actors, null: false
      t.string :Title
      t.string :Rated
      t.string :Released
      t.string :Runtime
      t.string :Genre
      t.string :Director
      t.string :Writer
      t.string :Actors
      t.string :Plot
      t.string :Language
      t.string :Country
      t.string :Awards
      t.string :Poster
      t.string :Metascore
      t.string :imdbRating
      t.string :imdbVotes
      t.string :imdbID, unique: true, index: true
      t.string :Type
      t.string :Response
      t.string :totalSeasons

      t.timestamps
    end
  end
end
