class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_many :user_snacks, dependent: :destroy
  has_many :snacks, through: :user_snacks

  def similar_snacks(tolerance: 10)
    user_colors = snacks.flat_map { |snack| snack.flavors.pluck(:color) }.compact.uniq

    similar_flavor_ids = []
    user_colors.each do |color|
      next if color.blank?

      Flavor.find_each do |flavor|
        next if flavor.color.blank?
        if Flavor.similar_color?(color, flavor.color, tolerance: tolerance)
          similar_flavor_ids << flavor.id
        end
      end
    end

    Snack.joins(:flavors)
         .where(flavors: { id: similar_flavor_ids.uniq })
         .where.not(id: snacks.pluck(:id))
         .distinct
  end
end
