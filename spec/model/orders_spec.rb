require 'rails_helper'

describe 'Orderモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'OrderProductモデルとの関係' do
      it '1対Nの関係' do
        expect(Order.reflect_on_association(:order_products).macro).to eq :has_many
      end
    end
    context 'Userモデルとの関係' do
      it 'N対1の関係' do
        expect(Order.reflect_on_association(:user).macro).to eq :belongs_to
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
    let(:test_order) { FactoryBot.create(:order, user: user_a) }
    context 'get_shipping_informations_fromメソッドのテスト' do
      it '戻り値は正しいか' do
        expect(test_order.get_shipping_informations_from(user_a)).to eq user_a.full_name
      end
    end
    context 'break_postal_codeメソッドのテスト' do
      it '〇〇〇-〇〇〇〇で郵便番号が表示されるか' do
        expect(test_order.break_postal_code).to eq test_order.postal_code.first(3) + "-" + test_order.postal_code.last(4)
      end
    end
    context 'create_order_productsメソッドのテスト' do
      it 'カート内の商品データを返す' do
        expect(test_order.create_order_products(user_a)).to eq [cart_a]
      end
    end
  end
end