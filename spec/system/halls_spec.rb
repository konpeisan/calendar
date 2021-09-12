require 'rails_helper'

RSpec.describe "ホール登録", type: :system do
  
  before do
    @user = FactoryBot.create(:user)
    @hall = FactoryBot.build(:hall)
  end

  context 'ホール登録ができる時' do
    it 'ホールを追加することができる' do
      #ログインする
      sign_in(@user)
      #トップページにホール作成ページへのボタンがあることを確認する
      expect(page).to have_content('ホール名')
      #ホール作成ページに遷移する
      visit halls_path
      #ホール名を入力する
      fill_in 'ホール名', with: @hall.store
      #追加ボタンを押すとHallモデルのカウントが1上がることを確認する
      expect{find('input[name="commit"]').click}.to change{Hall.count}.by(1)
      #ホール作成ページに遷移したことを確認する
      expect(current_path).to eq(halls_path)
      #作成したホール名が追加されていることを確認する
      expect(page).to have_content(@hall_store)
    end
  end
end

RSpec.describe 'ホールの編集', type: :system do

  before do
    @hall1 = FactoryBot.create(:hall)
  end

  context 'ホールの編集ができるとき' do
    it 'ログインしたユーザーは自分が登録したホールの編集ができる' do
      # type1を投稿したユーザーでログインする
      sign_in(@hall1.user)
      # ホール名ページへ遷移する
      visit halls_path
      # hall1に「編集」へのリンクがあることを確認する
      expect(page).to have_link '編集', href: edit_hall_path(@hall1)
      # 編集ページへ遷移する
      visit edit_hall_path(@hall1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(find('#hall_store').value).to eq(@hall1.store)
      # 投稿内容を編集する
      fill_in 'ホール名', with: "#{@hall1.store}+編集したホール名"
      # 編集してもHallモデルのカウントは変わらないことを確認する
      expect{find('input[name="commit"]').click}.to change { Hall.count }.by(0)
      # ホール名ページに遷移したことを確認する
      expect(current_path).to eq halls_path
      # 機種ページには先ほど変更した内容の機種名が存在することを確認する
      expect(page).to have_content("#{@hall1.store}+編集したホール名")
    end
  end
end

RSpec.describe 'ホール名削除', type: :system do

  before do
    @hall1 = FactoryBot.create(:hall)
  end

  context 'ホール名を削除ができるとき' do
    it 'ログインしたユーザーは自らが登録したホール名の削除ができる' do
      # hall1を投稿したユーザーでログインする
      sign_in(@hall1.user)
      # 機種ページへ遷移する
      visit halls_path
      # hall1に「削除」へのリンクがあることを確認する
      expect(page).to have_link '削除', href: hall_path(@hall1)
      #hall1削除へのリンクをクリックする
      click_on '削除'
      #削除ボタンを押すとダイアログが出てくる
      page.driver.browser.switch_to.alert.accept
      # ホール名ページに遷移したことを確認する
      expect(current_path).to eq halls_path
      # ホール名ページにはhall1の内容が存在しないことを確認する
      expect(page).to have_no_content("#{@hall1.store}")
    end
  end
end

