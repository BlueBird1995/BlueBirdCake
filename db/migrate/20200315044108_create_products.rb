class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id, null: false
      t.string :product_image_id
      t.integer :price, null: false
      t.text :description, null: false
      t.boolean :status, null: false, default: "true"
      t.string :name ,null: false
      t.timestamps
    end
  end
end
