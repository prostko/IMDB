class Movie < ApplicationRecord
  include ApplicationHelper
  has_many :likes

  has_many :comments
  has_many :watchlists

  validates :Title, presence: true
  validates :imdbID, uniqueness: true

  after_create :update_movie_info

  def related_movies
    first_word = self.Title.split(' ')[0]
    if first_word == 'The' || first_word == 'the'
      first_word = self.Title.split(' ')[1]
    end
    related_pictures = Movie.where("movies.Title LIKE ?", "%" + first_word + "%").limit(7)
  end

private
  def update_movie_info
    get_movie_by_id(self.imdbID)
  end
end
