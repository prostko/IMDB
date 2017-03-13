class Movie < ApplicationRecord
  has_many :likes
  has_many :comments, as: :commentable
  has_many :watchlists
  validates :title, :plot, :actors, presence: true
end
