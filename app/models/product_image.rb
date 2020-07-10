class ProductImage < ApplicationRecord
  attachment :image
  belongs_to :type
end
