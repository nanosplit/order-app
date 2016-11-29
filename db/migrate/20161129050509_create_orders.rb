class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :venue_id
      t.integer :user_id
      t.integer :total, default: 0
      t.jsonb :products, null: false, default: '{}'

      t.timestamps
    end
    add_index :orders, :products, using: :gin
  end
end
