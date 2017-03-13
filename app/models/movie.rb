class Movie < ApplicationRecord
  validates :title, :plot, :actors, presence: true


  has_many :likes
  has_many :comments, as: :commentable

end
