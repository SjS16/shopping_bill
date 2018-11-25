class Product < ApplicationRecord
  enum pricing_method: { weight: 0, item: 1 }
end
