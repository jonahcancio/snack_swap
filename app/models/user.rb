class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email, with: ->(e) { e.strip.downcase }
  validates :email, presence: true, uniqueness: true

  has_many :user_snacks, dependent: :destroy
  has_many :snacks, through: :user_snacks
end
