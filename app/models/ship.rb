class Ship < ApplicationRecord
  belongs_to :user

  def order_address_data
    '〒' + self.postal_code.first(3) + "-" + self.postal_code.last(4) + '  ' + self.address + '  ' + self.name
  end
end
