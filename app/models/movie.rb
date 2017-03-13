class Movie < ApplicationRecord
  has_many :likes
  has_many :comments, as: :commentable
  has_many :watchlists
  validates :Title, :Plot, :Actors, presence: true
end
