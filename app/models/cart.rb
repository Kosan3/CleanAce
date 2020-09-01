class Cart < ApplicationRecord
  belongs_to :product_detail
  belongs_to :user

  def subtotal
    self.product_detail.non_taxed_price * self.quantity
  end
end
