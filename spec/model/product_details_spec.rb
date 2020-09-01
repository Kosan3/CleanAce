require 'rails_helper'

describe 'ProductDetailモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'Productモデルとの関係' do
      it 'N対1の関係' do
        expect(ProductDetail.reflect_on_association(:product).macro).to eq :belongs_to
      end
    end
    context 'ProductSizeモデルとの関係' do
      it 'N対1の関係' do
        expect(ProductDetail.reflect_on_association(:product_size).macro).to eq :belongs_to
      end
    end
    context 'ProductColorモデルとの関係' do
      it 'N対1の関係' do
        expect(ProductDetail.reflect_on_association(:product_color).macro).to eq :belongs_to
      end
    end
    context 'Cartモデルとの関係' do
      it '1対Nの関係' do
        expect(ProductDetail.reflect_on_association(:carts).macro).to eq :has_many
      end
    end
    context 'OrderProductモデルとの関係' do
      it '1対Nの関係' do
        expect(ProductDetail.reflect_on_association(:order_products).macro).to eq :has_many
      end
    end
  end

  describe 'バリデーションのテスト' do
    let!(:test_product_detail) { build(:product_detail) }
    context 'non_taxed_priceカラムのテスト' do
      it '空白でないこと' do
        test_product_detail.non_taxed_price = ''
        expect(test_product_detail.valid?).to eq false;
      end
    end
  end
end