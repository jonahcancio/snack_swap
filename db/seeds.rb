# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

UserSnack.destroy_all
SnackFlavor.destroy_all
Flavor.destroy_all
Snack.destroy_all
User.destroy_all


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

flavors = [
  { name: "Chocolate", color: "#6B3E26", score: 9.0 },
  { name: "Vanilla", color: "#F3E5AB", score: 0.5 },
  { name: "Strawberry", color: "#FF6384", score: 8.2 },
  { name: "Mint", color: "#00FFAA", score: 7.5 },
  { name: "Blueberry", color: "#4F86F7", score: 7.8 },
  { name: "Caramel", color: "#FFDDA0", score: 8.5 },
  { name: "Lemon", color: "#FFF44F", score: 6.0 },
  { name: "Raspberry", color: "#E30B5D", score: 8.0 },
  { name: "Matcha", color: "#98FB98", score: 7.2 },
  { name: "Coffee", color: "#6F4E37", score: 9.1 }
]

flavors = flavors.map { |f| Flavor.create!(f) }

snacks = [
  { name: "Choco Delight", description: "Rich chocolate treat", img_url: "https://images.stockcake.com/public/0/e/6/0e6ab6c1-0a08-4435-80f6-8d88889a228e_large/delicious-chocolate-drink-stockcake.jpg", flavor_indices: [0, 5] },
  { name: "Berry Blast", description: "Sweet strawberry & raspberry combo", img_url: "https://thumbs.dreamstime.com/b/vibrant-refreshing-berry-smoothie-displayed-tall-glass-adorned-fresh-strawberry-rim-rich-pink-hue-speckled-386518176.jpg", flavor_indices: [2, 7] },
  { name: "Minty Fresh", description: "Cool mint & matcha dessert", img_url: "https://images.stockcake.com/public/0/d/9/0d9dbef3-6cb4-4223-bbb5-c28f83ccc6ad_large/minty-aqua-cocktail-stockcake.jpg", flavor_indices: [3, 8] },
  { name: "Lemon Twist", description: "Tangy lemon & blueberry snack", img_url: "https://thumbs.dreamstime.com/b/refreshing-cocktail-served-tall-glass-ice-lemon-twist-bar-filled-fizzy-garnished-set-against-blurred-333735463.jpg", flavor_indices: [6, 4] },
  { name: "Coffee Brownie", description: "Fudgy brownie with coffee kick", img_url: "https://img.freepik.com/free-photo/delicious-coffee-cup-indoors_23-2150691347.jpg?semt=ais_hybrid&w=740&q=80", flavor_indices: [9, 0] },
  { name: "Vanilla Caramel Swirl", description: "Classic vanilla with caramel goodness", img_url: "https://thumbs.dreamstime.com/b/delicious-vanilla-milkshake-clear-plastic-cup-whipped-cream-crunchy-granola-topping-caramel-drizzle-isolated-white-357544481.jpg", flavor_indices: [1, 5] }
]

snacks = snacks.map do |s|
  snack = Snack.create!(
    name: s[:name],
    description: s[:description],
    img_url: s[:img_url]
  )
  snack.flavors << [flavors[s[:flavor_indices][0]], flavors[s[:flavor_indices][1]]]
  snack
end


user1.snacks << snacks
user2.snacks << snacks.first(3)

puts "✅ Seed completed successfully!"
puts "Users: #{User.count}, Snacks: #{Snack.count}, Flavors: #{Flavor.count}"


