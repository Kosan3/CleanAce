class Order < ApplicationRecord

  has_many :order_products
  belongs_to :user

  enum payment_method: { credit_card: 0, transfer: 1 }

  scope :today_orders, -> { where(cancel: false, created_at: Time.zone.now.all_day) }
  scope :today_cancels, -> { where(cancel: true, updated_at: Time.zone.now.all_day) }

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
  end

  def break_postal_code
    self.postal_code.first(3) + "-" + self.postal_code.last(4)
  end

  def create_order_products(user)
    carts = user.carts
    carts.each do |cart|
      OrderProduct.create!(
        order_id: id,
        product_detail_id: cart.product_detail.id,
        quantity: cart.quantity,
        taxed_price: cart.product_detail.non_taxed_price
      )
    end
  end
end
