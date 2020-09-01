require 'rails_helper'

describe 'Userモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    let(:test_user) { FactoryBot.build(:user) }
    context '正常データの場合' do
      it 'バリデーションが有効' do
        expect(test_user.valid?).to eq true;
      end
    end
    context 'last_nameカラム' do
      it '空欄でないこと' do
        test_user.last_name = ''
        expect(test_user.valid?).to eq false;
      end
    end
    context 'first_nameカラム' do
      it '空欄でないこと' do
        test_user.first_name = ''
        expect(test_user.valid?).to eq false;
      end
    end
    context 'kana_last_nameカラム' do
      it '空欄でないこと' do
        test_user.kana_last_name = ''
        expect(test_user.valid?).to eq false;
      end
      it '全角カタカナであること' do
        test_user.kana_last_name = 'テすと'
        expect(test_user.valid?).to eq false;
      end
    end
    context 'kana_first_nameカラム' do
      it '空欄でないこと' do
        test_user.kana_first_name = ''
        expect(test_user.valid?).to eq false;
      end
      it '全角カタカナであること' do
        test_user.kana_first_name = 'テすと'
        expect(test_user.valid?).to eq false;
      end
    end
    context 'postal_codeカラム' do
      it '空欄でないこと' do
        test_user.postal_code = ''
        expect(test_user.valid?).to eq false;
      end
      it '7桁の数字であること' do
        test_user.postal_code = '123456'
        expect(test_user.valid?).to eq false;
      end
    end
    context 'addressカラム' do
      it '空欄でないこと' do
        test_user.address = ''
        expect(test_user.valid?).to eq false;
      end
    end
    context 'phone_numberカラム' do
      it '空欄でないこと' do
        test_user.phone_number = ''
        expect(test_user.valid?).to eq false;
      end
      it '10桁or11桁の数字であること' do
        test_user.phone_number = '012345678'
        expect(test_user.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Cartモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:carts).macro).to eq :has_many
      end
    end
    context 'Orderモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:orders).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end

  describe 'メソッドのテスト' do
    let(:test_user) { FactoryBot.build(:user) }
    context 'full_nameメソッドのテスト' do
      it 'フルネームが返される' do
        expect(test_user.full_name).to eq test_user.last_name + "　" + test_user.first_name
      end
    end
    context 'kana_full_nameメソッドのテスト' do
      it 'カナフルネームが返される' do
        expect(test_user.kana_full_name).to eq test_user.kana_last_name + '　' + test_user.kana_first_name
      end
    end
    context 'postal_code_breakメソッドのテスト' do
      it '〇〇〇-〇〇〇〇で郵便番号が表示される' do
        expect(test_user.postal_code_break).to eq test_user.postal_code.first(3) + '-' + test_user.postal_code.last(4)
      end
    end
    context 'phone_number_breakメソッドのテスト' do
      context '11桁の場合' do
        it '〇〇〇-〇〇〇〇-〇〇〇〇で電話番号が表示される' do
          expect(test_user.phone_number_break).to eq test_user.phone_number.first(3) + "-" + test_user.phone_number[3,4] + "-" + test_user.phone_number.last(4)
        end
      end
    end
    context 'has_in_cartメソッドのテスト' do
      let!(:user_a) { FactoryBot.create(:user) }
      let!(:size) { FactoryBot.create(:product_size) }
      let!(:color) { FactoryBot.create(:product_color) }
      let!(:product_a) { FactoryBot.create(:product) }
      let!(:product_detail_a) { FactoryBot.create(:product_detail, product: product_a, product_size: size, product_color: color) }
      let!(:cart_a) { FactoryBot.create(:cart, user: user_a, product_detail: product_detail_a) }
      it 'has_in_cartメッソドが存在するか' do
        expect(test_user).to respond_to(:has_in_cart)
      end
      it '返り値が有効か' do
        expect(user_a.has_in_cart(product_detail_a)).to eq cart_a;
      end
    end
  end
end