class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "price", null: false
    t.integer "stock", null: false
    t.string "status", default: "着手不可"
      t.timestamps
    end
  end
end
