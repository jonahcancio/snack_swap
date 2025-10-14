class Flavor < ApplicationRecord
  has_many :snack_flavors, dependent: :destroy
  has_many :snacks, through: :snack_flavors
end
