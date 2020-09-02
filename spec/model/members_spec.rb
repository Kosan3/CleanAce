require 'rails_helper'

describe 'Memberモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    let(:test_member) { FactoryBot.build(:member) }
    subject { test_member.valid? }
    context 'nameカラムのテスト' do
      it '空白でないこと' do
        test_member.name = ''
        is_expected.to eq false;
      end
    end
    context 'en_nameカラムのテスト' do
      it '空白でないこと' do
        test_member.en_name = ''
        is_expected.to eq false;
      end
    end
    context 'positionカラムのテスト' do
      it '空白でないこと' do
        test_member.position = ''
        is_expected.to eq false;
      end
    end
    context 'introductionカラムのテスト' do
      it '空白でないこと' do
        test_member.introduction = ''
        is_expected.to eq false;
      end
    end
    context 'uniform_numberカラムのテスト' do
      it '空白でないこと' do
        test_member.uniform_number = ''
        is_expected.to eq false;
      end
    end
  end
end