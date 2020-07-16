class Product < ApplicationRecord
  belongs_to :type
  belongs_to :product_size
  belongs_to :product_color
  has_many :carts, dependent: :destroy
  has_many :order_products
  accepts_nested_attributes_for  :product_size, :product_color
end
