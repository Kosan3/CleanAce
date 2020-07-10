class Product < ApplicationRecord
  belongs_to :type
  belongs_to :product_size
  belongs_to :product_color
  belongs_to :product_image
  has_many :order_products
  accepts_nested_attributes_for  :product_size, :product_color, :product_image
end
