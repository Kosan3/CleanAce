class ProductImage < ApplicationRecord
  attachment :image
  has_many :products
end
