

require 'rails_helper'

RSpec.describe User, type: :system do
  # background do
  # @user = User.create!(name: 'testさん', birthday:'1990-02-21', sex:'男', email:'testtesttest@sample.com', tel:'000-000-1111', password:'testtesttest',password_confirmation:'testtesttest',admin:'false' )
  # let(:user) { create(:user) }
  # # let(:second_user) { create(:second_user) }
  # end

  describe 'Userの新規登録' do
    it 'User新規作成' do
      visit new_user_registration_path
      fill_in 'user[name]', with: 'hogehoge'
      fill_in 'user[birthday]', with: '1990-01-11'
      fill_in 'user[sex]', with: '1'
      fill_in 'user[email]', with: 'hogehoge@mail.com'
      fill_in 'user[tel]', with: 'hogehoge'
      fill_in 'user[password]', with: 'hogehoge'
      fill_in 'user[password_confirmation]', with: 'hogehoge'
      click_on '会員登録'
    end
  end

  describe 'Sessionログイン／ログアウトの確認' do
    it 'ログインできること' do
      user
      visit new_user_session_path
      fill_in 'user[email]', with: 'hogehoge@mail.com'
      fill_in 'user[password]', with: 'hogehoge'
      click_on 'ログイン'
      # expect(page).to have_content 'ログインしました。'
    end
    it 'ログアウトできること' do
      user
      visit users_path
      click_on 'ログアウト'
      # expect(page).to have_content 'ログアウトしました。'
    end
  end
end
