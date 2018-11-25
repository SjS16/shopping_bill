class Bill < ApplicationRecord
  has_many :items

  before_save :calc_total

  def calc_total
    items.collect { |item|
      item.discount.blank? ? (item.quantity * item.product.price) : ((item.quantity * item.product.price) - item.discount)
    }.sum
  end

end
