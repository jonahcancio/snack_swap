class CreateSnackFlavors < ActiveRecord::Migration[8.0]
  def change
    create_table :snack_flavors do |t|
      t.references :snack, null: false, foreign_key: true
      t.references :flavor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
