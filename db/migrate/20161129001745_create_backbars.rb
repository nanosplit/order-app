class CreateBackbars < ActiveRecord::Migration[5.0]
  def change
    create_table :backbars do |t|
      t.integer :venue_id
      t.integer :product_id
      t.integer :price

      t.timestamps
    end
  end
end
