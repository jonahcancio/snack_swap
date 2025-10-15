class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_many :user_snacks, dependent: :destroy
  has_many :snacks, through: :user_snacks
end
