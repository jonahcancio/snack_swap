require 'color'
class Flavor < ApplicationRecord
  has_many :snack_flavors, dependent: :destroy
  has_many :snacks, through: :snack_flavors

  def similar_to?(other)
    hex2 = other.is_a?(Flavor) ? other.color : other
    self.class.similar_color?(color, hex2)
  end

  def near_complementary_to?(other)
    hex2 = other.is_a?(Flavor) ? other.color : other
    self.class.near_complementary_color?(color, hex2)
  end

  def self.hex_to_rgb(hex)
    hex = hex.delete('#')
    r, g, b = hex.scan(/../).map { |c| c.to_i(16) }
    [r, g, b]
  end

  def self.hex_to_hue(hex)
    Color::RGB.by_hex(hex).to_hsl.h
  end

  def self.similar_color?(hex1, hex2, tolerance: 0.1)
    h1 = hex_to_hue(hex1)
    h2 = hex_to_hue(hex2)
    diff = (h1 - h2).abs
    diff <= tolerance
  end

  def self.complementary_color?(hex1, hex2, tolerance: 0.1)
    h1 = hex_to_hue(hex1)
    h2 = hex_to_hue(hex2)
    diff = (h1 - h2).abs
    (0.5 - diff).abs <= tolerance
  end
end
