# 🍫 Snack Swap

Snack Swap is a Rails application for sharing and swapping your favorite snacks and their flavors. 
It’s built with **Ruby on Rails 8**, **Bootstrap 5**, and **Turbo/Hotwire**.

---

![sample-img.png](sample-img.png)

## ✨ Features

- 👤 **User Authentication**
    - Lightweight authentication system using Rails’ built-in `has_secure_password`
    - Users must be logged in to view or manage snacks

- 🍭 **Snack Management**
    - Create, edit, and delete snacks
    - Each snack can have multiple flavors
    - Snacks are displayed as interactive Bootstrap cards
    - Flavors are displayed as colored Bootstrap badges

- 🎨 **Flavor Filtering**
    - Filter snacks by flavor from a dropdown selector
    - Flavor tags are color-coded for visual clarity

- 🔄 **Snack Swapping**
    - Suggests similar or complementary snacks based on shared flavors
    - uses Swap buttons for quick swapping in and out

- 💡 **Snack of the Day**
    - Highlights the most Popular Snack

- ⚡ **Turbo Modal UI**
    - Add/Edit/Delete snacks through modals
    - All functions happen on virtually the same page

---

## 🧩 Models and Relationships

```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  has_many :user_snacks, dependent: :destroy
  has_many :snacks, through: :user_snacks
  
  def similar_snacks
  def complementary_snacks
end

# app/models/snack.rb
class Snack < ApplicationRecord
  has_many :user_snacks, dependent: :destroy
  has_many :users, through: :user_snacks

  has_many :snack_flavors, dependent: :destroy
  has_many :flavors, through: :snack_flavors

  def self.most_popular

end

# app/models/flavor.rb
class Flavor < ApplicationRecord
  has_many :snack_flavors, dependent: :destroy
  has_many :snacks, through: :snack_flavors
  
  def self.similar_color?(hex1, hex2, tolerance: 0.1)

  def self.complementary_color?(hex1, hex2, tolerance: 0.1)

end
```

## 🧪 Testing

Snack Swap uses **RSpec**, **FactoryBot**, and **Capybara** for its testing framework.  
All main features and associations are tested, including:

- `User#similar_snacks`
- `User#complementary_snacks`
- `Snack.most_popular`
- All CRUD requests for **Snacks**

---

### ⚙️ Running Tests

To run model specs:

```bash
bundle exec rspec spec/models
```

To run request specs:

```bash
bundle exec rspec spec/requests
```


