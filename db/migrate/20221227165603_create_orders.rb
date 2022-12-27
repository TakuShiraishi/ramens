class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer "customer_id", null: false
      t.integer "pay_type", default: 0, null: false
      t.integer "total_payment", null: false
      t.integer "order_status", default: 0, null: false
      t.string "name", null: false
      t.string "postal_code", null: false
      t.string "address", null: false
      t.integer "postage", null: false
      t.timestamps
    end
  end
end
