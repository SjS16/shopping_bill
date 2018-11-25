class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.decimal :total, precision: 10, scale: 2
      t.references :coupon
      t.string :coupon_code
      t.references :cart

      t.timestamps
    end
  end
end
