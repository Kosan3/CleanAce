class Entry < ApplicationRecord
  scope :today_entries, -> { where(created_at: Time.zone.now.all_day) }
end
