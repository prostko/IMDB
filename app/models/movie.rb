class Movie < ApplicationRecord
  has_many :likes
  has_many :comments, as: :commentable
  has_many :watchlists
  validates :Title, presence: true
end
