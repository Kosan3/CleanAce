class Cart < ApplicationRecord
  belongs_to :product

  def subtotal
    self.product.non_taxed_price * self.quantity
  end
end
