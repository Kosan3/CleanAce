require 'rails_helper'

describe 'ログインに関するテスト', type: :system do
  describe 'ログインのテスト' do
    let(:user_a) { FactoryBot.create(:user) }
    let(:user_b) { FactoryBot.create(:user, last_name: '山田', first_name: '太郎', email: 'b@example.com') }
    let(:admin) { FactoryBot.create(:user, email: 'c@admin.com', admin: true) }
    before do
      visit sign_in_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end
    context 'ユーザーAでログインしたとき' do
      let(:login_user) { user_a }
      it 'トップページに偏移し名前が表示される' do
        expect(page).to have_content 'テスト_姓'
      end
    end
    context 'ユーザーBでログインしたとき' do
      let(:login_user) { user_b }
      it 'トップページに偏移し名前が表示される' do
        expect(page).to have_content '山田'
      end
    end
    context 'アドミンでログインしたとき' do
      let(:login_user) { admin }
      it 'アドミントップページに偏移' do
        expect(page).to have_content 'メンバー募集情報'
      end
    end
  end
end
