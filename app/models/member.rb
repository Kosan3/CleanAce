class Member < ApplicationRecord
  validates :name, presence: true
  validates :en_name, presence: true
  validates :position, presence: true
  validates :uniform_number, presence: true
  validates :introduction, presence: true
end
