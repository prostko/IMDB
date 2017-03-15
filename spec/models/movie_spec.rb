require 'rails_helper'

RSpec.describe Movie, type: :model do

 describe 'validations' do
   before(:example) do
     Movie.new.get_movies_by_title("Fight Club")
     @movie = Movie.all.sample
   end

   it 'creates new movies if successfully created' do
     expect(@movie).to be_kind_of(Movie)
   end

   it 'has a Title' do
     expect(@movie.Title).to be_kind_of(String)
   end

   it 'has an imdbID' do
     expect(@movie.imdbID).to be_kind_of(String)
   end
 end

 describe 'related movies method' do

   before(:example) do
     Movie.new.get_movies_by_title("Fight Club")
     @movie = Movie.all.sample
     @related_movies = @movie.related_movies
   end

   it 'returns an array of movie objects' do
     expect(@related_movies.all.sample).to be_kind_of(Movie)
   end
 end

end
