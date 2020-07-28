require 'rails_helper'

describe 'ログイン機能', type: :system do
  describe 'ログイン画面' do
    before do
      user_a = FactoryBot.create(:user)
    end
    context 'ログインする' do
      before do
        visit sign_in_path
        fill_in 'メールアドレス', with: 'example@com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end
      it 'root_pathへ偏移する' do
        expect(page).to have_content 'ようこそ'
      end
    end
  end
end
