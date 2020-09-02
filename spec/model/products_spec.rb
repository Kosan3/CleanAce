require 'rails_helper'

describe 'Productモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'ProductDetailモデルとの関係' do
      it '1:Nであること' do
        expect(Product.reflect_on_association(:product_details).macro).to eq :has_many
      end
    end
    context 'ProductImageモデルとの関係' do
      it '1対Nであること' do
        expect(Product.reflect_on_association(:product_images).macro).to eq :has_many
      end
    end
    context 'ProductSizeモデルとの関係' do
      it '1対Nであること' do
        expect(Product.reflect_on_association(:product_sizes).macro).to eq :has_many
      end
    end
    context 'ProductColorモデルとの関係' do
      it '1対Nであること' do
        expect(Product.reflect_on_association(:product_colors).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1対Nであること' do
        expect(Product.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end

  describe 'バリデーションのテスト' do
    let(:test_product) { FactoryBot.build(:product) }
    subject { test_product.valid? }
    context 'product_nameカラムのテスト' do
      it 'カラムが有効であるか' do
        test_product.product_name = 'テスト'
        is_expected.to eq true;
      end
      it '空欄でないこと' do
        test_product.product_name = ''
        is_expected.to eq false;
      end
    end
    context 'introductionカラムのテスト' do
      it 'カラムが有効であるか' do
        test_product.introduction = 'テストテストテスト'
        is_expected.to eq true;
      end
      it '空欄でないこと' do
        test_product.introduction = ''
        is_expected.to eq false;
      end
    end
  end

  describe 'メソッドのテスト' do
    let!(:test_product) { FactoryBot.create(:product) }
    let!(:size) { FactoryBot.create(:product_size) }
    let!(:color) { FactoryBot.create(:product_color) }
    let!(:test_product_detail) { FactoryBot.create(:product_detail, product: test_product, product_size: size, product_color: color) }
    context 'squeeze_productメソッドのテスト' do
      it 'メソッドが存在するか' do
        expect(test_product).to respond_to(:squeeze_product)
      end
    end
    context 'favorite_by?メソッドのテスト' do
      let!(:user_a) { FactoryBot.create(:user) }
      it 'ユーザーが存在するか' do
        expect(test_product.favorited_by?(user_a)).to eq false;
      end
    end
    context 'price_displayメソッドのテスト' do
      it '550が表示される' do
        expect(test_product.price_display).to eq 550
      end
    end
  end
end