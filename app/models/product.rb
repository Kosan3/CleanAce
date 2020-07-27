class Product < ApplicationRecord
  attachment :image
  has_many :product_details, dependent: :destroy
  has_many :product_images, dependent: :destroy
  has_many :product_sizes, through: :product_details, dependent: :destroy
  has_many :product_colors, through: :product_details, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def squeeze_product(params)
    product_details.includes(:product_size, :product_color).find_by(product_sizes: { size: params[:cart][:size] }, product_colors: { color: params[:cart][:color] })
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
