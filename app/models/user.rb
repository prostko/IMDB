class User < ApplicationRecord
  has_many :comments
  has_one :watch_list

  has_secure_password
  validates :name, :email, presence: true
end
