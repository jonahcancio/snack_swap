class Snack < ApplicationRecord
  validates :name, presence: true

  has_many :user_snacks, dependent: :destroy
  has_many :users, through: :user_snacks

  has_many :snack_flavors, dependent: :destroy
  has_many :flavors, through: :snack_flavors

  def similar_color_snacks(tolerance: 15)
    return Snack.none if flavors.empty? || flavors.pluck(:color).compact.empty?

    similar_flavor_ids = []

    flavors.each do |flavor|
      next if flavor.color.blank?

      Flavor.find_each do |other|
        next if other.color.blank?
        if Flavor.similar_color?(flavor.color, other.color, tolerance: tolerance)
          similar_flavor_ids << other.id
        end
      end
    end

    Snack.joins(:flavors)
         .where(flavors: { id: similar_flavor_ids.uniq })
         .where.not(id: id)
         .distinct
  end

  def complementary_color_snacks(tolerance: 15)
    return Snack.none if flavors.empty? || flavors.pluck(:color).compact.empty?

    complementary_flavor_ids = []

    flavors.each do |flavor|
      next if flavor.color.blank?

      Flavor.find_each do |other|
        next if other.color.blank?
        if Flavor.near_complementary_color?(flavor.color, other.color, tolerance: tolerance)
          complementary_flavor_ids << other.id
        end
      end
    end

    Snack.joins(:flavors)
         .where(flavors: { id: complementary_flavor_ids.uniq })
         .where.not(id: id)
         .distinct
  end


end
