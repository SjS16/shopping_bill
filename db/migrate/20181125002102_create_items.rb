class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :product
      t.references :cart
      t.decimal :quantity, precision: 10, scale: 1
      t.decimal :discount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
