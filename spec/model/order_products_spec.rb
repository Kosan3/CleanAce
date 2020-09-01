require 'rails_helper'

describe 'OrderProductモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'ProductDetailモデルとの関係' do
      it 'N対1の関係' do
        expect(OrderProduct.reflect_on_association(:product_detail).macro).to eq :belongs_to
      end
    end
  end
end