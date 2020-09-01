class ProductDetail < ApplicationRecord
  belongs_to :product
  belongs_to :product_size
  belongs_to :product_color
  has_many :carts, dependent: :destroy
  has_many :order_products
  accepts_nested_attributes_for  :product_size, :product_color

  validates :non_taxed_price, format: { with: /\d+/, message: '数字で入力してください。'}

end
