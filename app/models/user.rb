class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :favorited_movies, through: :likes, source: :movie
  has_many :watchlists
  has_many :watchlist_movies, through: :watchlists, source: :movie

  has_secure_password
  validates :name, :email, presence: true
end
