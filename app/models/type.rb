class Type < ApplicationRecord
  attachment :image
  has_many :products
  has_many :product_images
end
