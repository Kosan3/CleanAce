class Type < ApplicationRecord
  attachment :image
  has_many :products
end
