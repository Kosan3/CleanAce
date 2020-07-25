class Entry < ApplicationRecord

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :age, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true


  scope :today_entries, -> { where(created_at: Time.zone.now.all_day) }

  def full_name
    self.last_name + '　' + self.first_name
  end

  def kana_full_name
    self.kana_last_name + '　' + self.kana_first_name
  end
end
