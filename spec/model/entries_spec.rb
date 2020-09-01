require 'rails_helper'

describe 'Entryモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    let(:test_entry) { FactoryBot.build(:entry) }
    context 'last_nameカラム' do
      it '空白でない' do
        test_entry.last_name = ''
        expect(test_entry.valid?).to eq false;
      end
    end
    context 'first_nameカラム' do
      it '空白でない' do
        test_entry.first_name = ''
        expect(test_entry.valid?).to eq false;
      end
    end
    context 'kana_last_nameカラム' do
      it 'カタカナで入力されている' do
        test_entry.kana_last_name = 'あああ'
        expect(test_entry.valid?).to eq false;
      end
    end
    context 'kana_first_nameカラム' do
      it 'カタカナで入力されている' do
        test_entry.kana_first_name = 'あああ'
        expect(test_entry.valid?).to eq false;
      end
    end
    context 'ageカラム' do
      it '空白でない' do
        test_entry.age = ''
        expect(test_entry.valid?).to eq false;
      end
    end
    context 'postal_codeカラム' do
      it '数字7桁である' do
      end
    end
  end
end