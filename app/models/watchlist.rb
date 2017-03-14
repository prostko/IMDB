class Watchlist < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: { scope: :imdbID }
end
