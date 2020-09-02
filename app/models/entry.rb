class Entry < ApplicationRecord

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナを入力してください' }
  validates :kana_first_name, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナを入力してください' }
  validates :age, presence: true
  validates :postal_code, format: { with: /\A\w{7}\z/, message: 'が数字ではありません'}
  validates :address, presence: true
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :phone_number, format: { with: /\d{10,11}/, message: 'が間違っています'}


  scope :today_entries, -> { where(created_at: Time.zone.now.all_day) }

  def full_name
    self.last_name + '　' + self.first_name
  end

  def kana_full_name
    self.kana_last_name + '　' + self.kana_first_name
  end
end
