class CreateSnacks < ActiveRecord::Migration[8.0]
  def change
    create_table :snacks do |t|
      t.string :name, null: false
      t.string :description
      t.string :img_url

      t.timestamps
    end
  end
end
