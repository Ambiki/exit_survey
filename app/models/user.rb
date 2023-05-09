class User < ApplicationRecord
  has_many :surveys

  validates :email, presence: true
end
