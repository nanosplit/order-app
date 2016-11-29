class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :venue_id
      t.jsonb :products, null: false, default: '{}'

      t.timestamps
    end
    add_index :carts, :products, using: :gin
  end
end
