# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data for a clean start
UserSnack.destroy_all
SnackFlavor.destroy_all
Flavor.destroy_all
Snack.destroy_all
User.destroy_all

# Create sample users
user1 = User.create!(
  name: "Admin",
  email: "admin@admin.com",
  password: "admin123"
)

user2 = User.create!(
  name: "Hornet",
  email: "hornet@silksong.com",
  password: "shaw"
)

# Create flavors
chocolate = Flavor.create!(name: "Chocolate", color: "#6B3E26", score: 9.0)
vanilla   = Flavor.create!(name: "Vanilla") # defaults to color: '#FFFFFF', score: 0.5
strawberry = Flavor.create!(name: "Strawberry", color: "#FF6384", score: 8.2)
mint      = Flavor.create!(name: "Mint", color: "#00FFAA", score: 7.5)

# Create snacks
cookie = Snack.create!(
  name: "Cookie",
  description: "Classic chocolate chip cookie",
  img_url: "cookie.jpg"
)

ice_cream = Snack.create!(
  name: "Ice Cream",
  description: "Creamy vanilla ice cream",
  img_url: "ice_cream.jpg"
)

brownie = Snack.create!(
  name: "Brownie",
  description: "Fudgy chocolate brownie",
  img_url: "brownie.jpg"
)

# Associate snacks ↔ flavors
cookie.flavors << [chocolate, vanilla]
ice_cream.flavors << [vanilla, strawberry]
brownie.flavors << [chocolate, mint]

# Associate users ↔ snacks
user1.snacks << [cookie, ice_cream]
user2.snacks << [brownie]

puts "✅ Seed completed successfully!"
puts "Users: #{User.count}, Snacks: #{Snack.count}, Flavors: #{Flavor.count}"
