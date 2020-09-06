class ProductImage < ApplicationRecord
  attachment :image
  belongs_to :product

  validates :image_id, presence: true
end
