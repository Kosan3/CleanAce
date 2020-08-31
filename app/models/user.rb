class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :ships
  has_many :orders
  has_many :favorites, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true



  def has_in_cart(value)
    carts.find_by(product_detail_id: value.id)
  end

  def full_name
    self.last_name + "　" + self.first_name
  end

  def kana_full_name
    self.kana_last_name + "　" + self.kana_first_name
  end

  def postal_code_break
    self.postal_code.first(3) + '-' + self.postal_code.last(4)
  end

  def phone_number_break
    if self.phone_number.length == 10
      self.phone_number.first(3) + "-" + self.phone_number[3,3] + "-" + self.phone_number.last(4)
    elsif self.phone_number.length == 11
      self.phone_number.first(3) + "-" + self.phone_number[3,4] + "-" + self.phone_number.last(4)
    else
      self.phone_number.first(3) + "-" + self.phone_number[3,3] + "-" + self.phone_number.last(4)
    end
  end

end
