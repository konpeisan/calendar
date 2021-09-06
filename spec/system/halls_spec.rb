require 'rails_helper'

RSpec.describe "ホール登録", type: :system do
  before do
    @budget = FactoryBot.build(:budget)
    @hall_store = Faker::Name.initials(number: 5)
  end

  context 'ホール登録ができる時' do
    it 'ホールを追加することができる' do
      #トップページへ遷移する
      visit root_path
      #トップページにホール作成ページへのボタンがあることを確認する
      expect(page).to have_content("ホール名")
      #ホール作成ページに遷移する
      visit halls_path
      #ホール名を入力する
      fill_in 'ホール名', with: @hall_store
      #追加ボタンを押すとHallモデルのカウントが1上がることを確認する
      expect{find('input[name="commit"]').click}.to change{Hall.count}.by(1)
      #ホール作成ページに遷移したことを確認する
      expect(current_path).to eq(halls_path)
      #作成したホール名が追加されていることを確認する
      expect(page).to have_content(@hall_store)
    end
  end
end

RSpec.describe "ホール編集", type: :system do

  before do
    @hall1 = FactoryBot.create(:hall)
  end

  context 'ホール名を編集できる時' do
    it '登録したホール名を編集することができる' do
      #ホール作成ページへ遷移する
      visit halls_path
      #作成されたホール名に編集へのリンクがあることを確認する
      expect(page).to have_link '編集', href: edit_hall_path(@hall1)
      #編集ページへ遷移する
      visit edit_hall_path(@hall1)
      #すでに登録済みのホール名が入っていることを確認する
      expect(find('#hall_store').value).to eq(@hall1.store)
      #ホール名を編集する
      fill_in 'hall_store', with: "#{@hall1.store}+編集したホール名"
      #編集してもHallモデルのカウントは変わらないことを確認する
      expect{find('input[name="commit"]').click}.to change{Hall.count}.by(0)
      #ホール作成ページに遷移したことを確認する
      expect(current_path).to eq(halls_path)
      #ホール作成ページには先ほど変更したホール名が存在することを確認する
      expect(page).to have_content("#{@hall1.store}+編集したホール名")
    end
  end
end

RSpec.describe 'ホール削除', type: :system do
  before do
    @hall1 = FactoryBot.create(:hall)
  end

  context 'ホールを削除できる時' do
    it '登録したホール名を削除できる' do
      #ホール作成ページに遷移する
      visit halls_path
      #作成されたホール名に削除へのリンクがあることを確認する
      expect(page).to have_link '削除', href: hall_path(@hall1)
      #削除ボタンを押すとダイアログが出てくる
      page.accept_confirm do
        click_on '削除'
      end
      #ホール作成ページに遷移したことを確認する
      expect(current_path).to eq(halls_path)
      #ホール作成ページには先ほどのホール１が存在しないことを確認する
      expect(page).to have_no_content("#{@hall1.store}")
    end
  end
end