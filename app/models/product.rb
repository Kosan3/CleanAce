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

  def price_display
    if self.product_details.count == 1
      price = self.product_details.first.non_taxed_price*1.1
      price.round
    elsif self.product_details.count >= 2
      if self.product_details.distinct.pluck(:non_taxed_price).count == 1
        product_details.first.non_taxed_price
      else
        self.product_details.first.non_taxed_price.to_s + ' 円～' + self.product_details.last.non_taxed_price.to_s
      end
    end
  end
end
