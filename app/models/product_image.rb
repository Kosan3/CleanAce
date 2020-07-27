class ProductImage < ApplicationRecord
  attachment :image
  belongs_to :product
end
