require 'rails_helper'

RSpec.describe Movie, type: :model do

 describe 'validations' do
   before(:each) do
     @movies = Movie.new.get_movies_by_title("Fight Club")
   end

   it 'creates new movies if successfully created' do
     expect(Movie.last).to be_kind_of(Movie)
   end
 end

end
