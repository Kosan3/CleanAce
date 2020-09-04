class ProductImage < ApplicationRecord
  attachment :image
  belongs_to :product

  validates :image, presence: true
end
