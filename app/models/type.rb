class Type < ApplicationRecord
  attachment :image
  has_many :products
  has_many :product_images
  has_many :product_sizes, through: :products
  has_many :product_colors, through: :products
  has_many :favorites, dependent: :destroy

  def squeeze_product(params)
    products.includes(:product_size, :product_color).find_by(product_sizes: { size: params[:cart][:size] }, product_colors: { color: params[:cart][:color] })
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
