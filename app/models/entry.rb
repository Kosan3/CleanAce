class Entry < ApplicationRecord
  scope :today_entries, -> { where(created_at: Time.zone.now.all_day) }

  def full_name
    self.last_name + '　' + self.first_name
  end

  def kana_full_name
    self.kana_last_name + '　' + self.kana_first_name
  end
end
