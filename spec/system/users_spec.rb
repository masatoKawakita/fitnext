

require 'rails_helper'

RSpec.describe User, type: :system do
  # before do
  # @user = User.create!(name: 'testさん', birthday:'2015/01/01', sex:'男', email:'testtesttest3@sample.com', tel:'000-000-1111', password:'testtesttest',password_confirmation:'testtesttest',admin:'false' )
  # # let(:user) { create(:user) }
  # # let(:second_user) { create(:second_user) }
  # end


  # 指摘事項
  # expectがないので、期待値と実際の値の確認が行われていない。異常系でも全てテスト成功になってしまう。
  # expectがあれば、そのコードの実行結果がtrue か falseかで、テスト成功、失敗を表示できる。

  # ログイン時のROLLBACKについて、処理がどこまでうまくいっているかの切り分けをしたい
  # 実行対象のControllerでbyebugし、@user.saveのバリデーション結果を確認したかったが、deviseなので確認できず
  # 画面上の処理がどうなっているかを確認したい。
  # sleepコマンドでテストケースが完了するまでにテストの進行を保留する

  # テスト実行時のdriverの設定をheadlessから変更し、ブラウザを表示させる --> rails_helper.rb
  # 実行対象のテストケースを指定する focus --> spec_helper.rb

  # 画面上でボタンを押して、処理が成功するかどうかを目で確認する --> バリデーションエラー、必須入力の項目が埋まっていない

  # tig --> brew install tig
  # tig status で差分確認、Add  Shift + c で AddしたものをCommit。完了したら git push xxxx

  describe 'Userの新規登録' do
    context '正常系' do
      it 'User新規作成ができる' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'hogehoge'
        # fill_in 'user[birthday]', with: '2019-10-22'
        fill_in 'user[birthday]', with: "2014/01/01"
        choose 'input user_gender_male'
        # choose 'user[sex]', with: '1'
        fill_in 'user[email]', with: 'hogehoge@mail.com'
        fill_in 'user[tel]', with: '111-1111-1111'
        fill_in 'user[password]', with: 'hogehoge'
        fill_in 'user[password_confirmation]', with: 'hogehoge'
        # sleep 10
        click_on '会員登録', match: :first
        # sleep 10
        expect(page).to have_content 'トレーナー一覧'
      end

    context '異常系' do
      it 'User新規作成バリデーションエラーによる失敗(パスワード未記入）' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'hogehoge4'
        # fill_in 'user[birthday]', with: '2019-10-22'
        fill_in 'user[birthday]', with: "2019/01/01"
        choose 'input user_gender_male'
        # choose 'user[sex]', with: '1'
        fill_in 'user[email]', with: 'hogehoge4@mail.com'
        fill_in 'user[tel]', with: '111-1111-4444'
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''
        # sleep 10
        click_on '会員登録', match: :first
        # sleep 10
      end
    end
  end

  describe 'Sessionログイン／ログアウトの確認' do
    context '正常系' do
      it 'ログイン・ログアウトができること' do
        # puts '-----------------------------------------'
        # puts "UserCount: #{User.count}"
        visit new_user_registration_path
        fill_in 'user[name]', with: 'hogehoge2'
        fill_in 'user[birthday]', with: "2010/01/01"
        choose 'input user_gender_male'
        fill_in 'user[email]', with: 'hogehoge2@mail.com'
        fill_in 'user[tel]', with: '000-0000-0000'
        fill_in 'user[password]', with: 'hogehoge2'
        fill_in 'user[password_confirmation]', with: 'hogehoge2'
        # sleep 5
        click_button '会員登録'
        # sleep 5
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
        visit new_user_session_path
        fill_in 'user[email]', with: 'hogehoge2@mail.com'
        fill_in 'user[password]', with: 'hogehoge2'
        click_on 'ログイン'
        # sleep 5
      end
    end

    context '異常系' do
      it 'ログインできない（パスワード未入力）' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'hogehoge2'
        fill_in 'user[birthday]', with: "2010/01/01"
        choose 'input user_gender_male'
        fill_in 'user[email]', with: 'hogehoge2@mail.com'
        fill_in 'user[tel]', with: '000-0000-0000'
        fill_in 'user[password]', with: 'hogehoge2'
        fill_in 'user[password_confirmation]', with: 'hogehoge2'
        # sleep 5
        click_button '会員登録'
        # sleep 5
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
        visit new_user_session_path
        fill_in 'user[email]', with: 'hogehoge2@mail.com'
        fill_in 'user[password]', with: ''
        click_on 'ログイン'
      end
    end
  end

    # it 'ログアウトできること' do
    #   # ログインをしてから実行する必要あり、ユーザーを作成していないので、ログイン自体が失敗する
    #   visit new_user_session_path
    #   fill_in 'user[email]', with: 'hogehoge@mail.com'
    #   fill_in 'user[password]', with: 'hogehoge'
    #   click_on 'ログイン'
    #   # find('ログアウト').click
    #   # find('.btn-border-bottom header-signout').click
    #   sleep 3
    # end
end
end
