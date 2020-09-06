class Order < ApplicationRecord

  has_many :order_products
  belongs_to :user

  

  enum payment_method: { credit_card: 0, transfer: 1 }

  scope :finish_orders, -> { where(cancel: false, order_checked: true, shipping: true, updated_at: Time.zone.now.all_day) }
  scope :finish_cancels, -> { where(cancel: true, cancel_checked: true, updated_at: Time.zone.now.all_day) }

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

  def create_ship(user, session)
    if session == true
      Ship.create!(
        user_id: user.id,
        name: self.address_name,
        postal_code: self.postal_code,
        address: self.address
      )
    end
  end

  def get_designated_date
    if self.designated_date
      self.designated_date.strftime('%-m月%-d日')
    else
      '指定なし'
    end
  end

  def get_shipping
    if self.shipping == true
      '発送済み'
    else
      '発送準備中'
    end
  end
end
