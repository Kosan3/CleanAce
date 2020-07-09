class Product < ApplicationRecord
  attachment :image
  belongs_to :type
  belongs_to :product_size
  belongs_to :product_name
  belongs_to :product_color
  has_many :order_products
  accepts_nested_attributes_for :product_name, :product_size, :product_color
end
