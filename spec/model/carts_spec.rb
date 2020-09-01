require 'rails_helper'

describe 'Cartモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'product_detailとの関係' do
      it 'N対1の関係' do
        expect(Cart.reflect_on_association(:product_detail).macro).to eq :belongs_to
      end
    end
    context 'Userモデルとの関係' do
      it 'N対1の関係' do
        expect(Cart.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end

  describe 'メソッドのテスト' do
    let(:user_a) { FactoryBot.create(:user) }
    let!(:size) { FactoryBot.create(:product_size) }
    let!(:color) { FactoryBot.create(:product_color) }
    let!(:product_a) { FactoryBot.create(:product) }
    let!(:product_detail_a) { FactoryBot.create(:product_detail, product: product_a, product_size: size, product_color: color) }
    let!(:cart_a) { FactoryBot.create(:cart, user: user_a, product_detail: product_detail_a) }
    context 'subotalメソッドのテスト' do
      it 'non_taxed_priceとquantityの積が返る' do
        expect(cart_a.subtotal).to eq 500
      end
    end
  end
end