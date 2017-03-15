class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :conversations

  validates :content, presence: true

end
