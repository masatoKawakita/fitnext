

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
      fill_in 'user[birthday]', with: ''
      choose 'input user_gender_male'
      # fill_in 'user[sex]', with: '1'
      fill_in 'user[email]', with: 'hogehoge@mail.com'
      fill_in 'user[tel]', with: 'hogehoge'
      fill_in 'user[password]', with: 'hogehoge'
      fill_in 'user[password_confirmation]', with: 'hogehoge'
      click_on '会員登録', match: :first
    end
  end

  describe 'Sessionログイン／ログアウトの確認' do
    it 'ログインできること' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'hogehoge@mail.com'
      fill_in 'user[password]', with: 'hogehoge'
      click_on 'ログイン'
    end

    it 'ログアウトできること' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'hogehoge@mail.com'
      fill_in 'user[password]', with: 'hogehoge'
      click_on 'ログイン'
      # find('ログアウト').click
      # find('.btn-border-bottom header-signout').click
    end
  end
end
