class Order < ApplicationRecord

  has_many :order_products

  enum payment_method: { credit_card: 0, transfer: 1 }

  def get_shipping_informations_from(resource)
    class_name = resource.class.name
    if class_name == 'User'
      self.postal_code = resource.postal_code
      self.address = resource.address
      self.address_name = resource.full_name
    else class_name == 'Ship'
      self.postal_code = resource.postal_code
      self.address = resource.address
      self.address_name = resource.name
    end

    def break_postal_code
      self.postal_code.first(3) + "-" + self.postal_code.last(4)
    end
  end

  def create_order_products(user)
    carts = user.carts
    carts.each do |cart|
      OrderProduct.create!(
        order_id: id,
        product_id: cart.product.id,
        quantity: cart.quantity,
        taxed_price: cart.product.non_taxed_price
      )
    end
  end
end
