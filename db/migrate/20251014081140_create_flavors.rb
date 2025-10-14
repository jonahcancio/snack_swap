class CreateFlavors < ActiveRecord::Migration[8.0]
  def change
    create_table :flavors do |t|
      t.string :name, null: false
      t.string :color, default: '#FFFFFF'
      t.float :score, default: 0.5

      t.timestamps
    end
  end
end
