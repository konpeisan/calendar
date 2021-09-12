require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページ(新規登録画面)に遷移する
      visit root_path
      # 新規登録画面にログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Log in')
      # ユーザー情報を入力する
      fill_in 'Username', with: @user.name
      fill_in 'Email', with: @user.email
      fill_in 'Password(6 characters minimum)', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      # Enterボタンを押すとUserモデルのカウントが1上がることを確認する
      expect{find('input[name="commit"]').click}.to change{User.count}.by(1)
      # カレンダーページへ遷移したことを確認する
      expect(current_path).to eq budgets_path
    end
    it 'ログインに成功し、カレンダーページに遷移する' do
      # 予め、ユーザーをDBに保存する
      @user = FactoryBot.create(:user)
      # サインインページへ遷移する
      visit  new_user_session_path
      # ログインしていない場合、サインインページに遷移していることを確認する
      expect(current_path).to eq new_user_session_path
      # すでに保存されているユーザーのemailとpasswordを入力する
      fill_in 'Username', with: @user.name
      fill_in 'Password', with: @user.password
      # ログインボタンをクリックする
      click_on 'Enter'
      # カレンダーページに遷移していることを確認する
      expect(current_path).to eq budgets_path
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページ(新規登録画面)に遷移する
      visit root_path
      # ユーザー情報を入力する
      fill_in 'Username', with: ''
      fill_in 'Email', with: ''
      fill_in 'Password(6 characters minimum)', with: ''
      fill_in 'Password confirmation', with: ''
      # 新規登録ボタンを押してもモデルのカウントは上がらないことを確認する
      expect{find('input[name="commit"]').click}.to change { User.count }.by(0)
      # 新規登録画面へ戻されることを確認する
      expect(current_path).to eq '/users'
    end
    it 'ログインに失敗し、再びサインインページに戻ってくる' do
      # 予め、ユーザーをDBに保存する
      @user = FactoryBot.create(:user)
      # サインインページへ遷移する
      visit  new_user_session_path
      # 誤ったユーザー情報を入力する
      fill_in 'Username', with: 'test'
      fill_in 'Password', with: 'test'
      # ログインボタンをクリックする
      click_on('Enter')
      # サインインページに戻ってきていることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe "ユーザー情報編集", type: :system do

  before do
    @user = FactoryBot.create(:user)
  end

  context 'ユーザー情報を編集できる時' do
    it '登録したユーザー情報を編集することができる' do
      # ログインする
      sign_in(@user)
      #カレンダーページにユーザー名編集リンクがあることを確認する
      expect(page).to have_link "#{@user.name}"
      #編集ページへ遷移する
      visit edit_user_registration_path(@user)
      #新しいユーザー名、パスワードを入力する
      fill_in 'Name', with: 'abc'
      fill_in 'Email', with: 'abc@abc'
      fill_in 'Password', with: '111111'
      fill_in 'Password confirmation', with: '111111'
      #今のパスワードも入力する
      fill_in 'Current password', with: @user.password
      #編集してもTypeモデルのカウントは変わらないことを確認する
      expect{find('input[name="commit"]').click}.to change{User.count}.by(0)
      #カレンダーページに遷移したことを確認する
      expect(current_path).to eq budgets_path
    end
  end
end

RSpec.describe "ユーザー情報削除", type: :system do

  before do
    @user = FactoryBot.create(:user)
  end

  context 'ユーザー情報を削除できる時' do
    it '登録したユーザー情報を削除できる' do
      #ログインする
      sign_in(@user)
      #ユーザー情報編集ページに遷移する
      visit edit_user_registration_path(@user)
      #ユーザー情報削除へのリンクをクリックする
      click_button 'Cancel my account'
      #削除ボタンを押すとダイアログが出てくる
      page.driver.browser.switch_to.alert.accept
      #トップページ(新規登録画面)に遷移したことを確認する
      expect(current_path).to eq root_path
    end
  end
end