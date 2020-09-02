require 'rails_helper'

describe 'Entryモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    let(:test_entry) { FactoryBot.create(:entry) }
    subject { test_entry.valid? }
    context 'テスト用データ' do
      it '有効であるか' do
        expect(test_entry.valid?).to eq true;
      end
    end
    context 'last_nameカラム' do
      it '空白でない' do
        test_entry.last_name = ''
        is_expected.to eq false;
      end
    end
    context 'first_nameカラム' do
      it '空白でない' do
        test_entry.first_name = ''
        is_expected.to eq false;
      end
    end
    context 'kana_last_nameカラム' do
      it 'カタカナで入力されている' do
        test_entry.kana_last_name = 'あああ'
        is_expected.to eq false;
      end
    end
    context 'kana_first_nameカラム' do
      it 'カタカナで入力されている' do
        test_entry.kana_first_name = 'あああ'
        is_expected.to eq false;
      end
    end
    context 'ageカラム' do
      it '空白でない' do
        test_entry.age = ''
        is_expected.to eq false;
      end
    end
    context 'postal_codeカラム' do
      it '有効である' do
        test_entry.postal_code = '1234567'
        is_expected.to eq true;
      end
      it '数字7桁である' do
        test_entry.postal_code = '123456'
        is_expected.to eq false;
      end
    end
    context 'addressカラム' do
      it '空白でない' do
        test_entry.address = ''
        is_expected.to eq false;
      end
    end
    context 'emailカラム' do
      it '不正な値' do
        test_entry.email = '0fafa8i3jfa'
        is_expected.to eq false;
      end
      it '有効な値' do
        test_entry.email = 'example@sample.com'
        is_expected.to eq true;
      end
    end
  end

  describe 'メソッドのテスト' do
    let(:test_entry) { FactoryBot.build(:entry) }
    context 'full_nameメソッドのテスト' do
      it 'フルネームを返す' do
        expect(test_entry.full_name).to eq test_entry.last_name + '　' + test_entry.first_name
      end
    end
    context 'kana_full_nameメソッドのテスト' do
      it 'カナフルネームを返す' do
        expect(test_entry.kana_full_name).to eq test_entry.kana_last_name + '　' + test_entry.kana_first_name
      end
    end
  end
end