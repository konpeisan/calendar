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

