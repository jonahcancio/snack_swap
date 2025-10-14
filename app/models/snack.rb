class Snack < ApplicationRecord
  validates :name, presence: true

  has_many :user_snacks, dependent: :destroy
  has_many :users, through: :user_snacks

  has_many :snack_flavors, dependent: :destroy
  has_many :flavors, through: :snack_flavors
end
