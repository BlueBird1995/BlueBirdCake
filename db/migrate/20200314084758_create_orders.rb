class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false, default: ""
      t.string :name, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.string :address, null: false, default: ""
      t.integer :payment, null: false, default: ""
      t.integer :total_price, null: false, default: ""
      t.integer :postage, null: false, default: "", default: 800
      t.string :status, null: false, default: "", default: "入金待ち"
      t.timestamps
    end
  end
end
