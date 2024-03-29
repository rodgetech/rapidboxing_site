class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.text :link
      t.text :details
      t.integer :quantity

      t.timestamps
    end
  end
end
