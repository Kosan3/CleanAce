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
  validates :kana_last_name, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナを入力してください' }
  validates :kana_first_name, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナを入力してください' }
  validates :postal_code, format: { with: /\A\d{7}\z/, message: 'は7桁の数字を入力してください'}
  validates :address, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'が間違っています'}



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
