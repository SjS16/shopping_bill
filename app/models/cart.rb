class Cart < ApplicationRecord
  has_many :items
  enum status: { open: 0, closed: 1 }

  def calc_total
    items.collect { |item|
      item.discount
      item.discount.blank? ? (item.quantity * item.product.price) : ((item.product.price - item.discount) * item.quantity)
    }.sum
  end

end
