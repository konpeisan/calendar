require 'rails_helper'

RSpec.describe "機種登録", type: :system do
  
  before do
    @user = FactoryBot.create(:user)
    @type = FactoryBot.build(:type)
  end

  context '機種登録ができる時' do
    it '機種を追加することができる' do
      #ログインする
      sign_in(@user)
      #トップページに機種作成ページへのボタンがあることを確認する
      expect(page).to have_content("機種名")
      #機種作成ページに遷移する
      visit types_path
      #種類、タイプを選択し、機種名を入力する
      expect(page).to have_checked_field with: 'パチンコ', visible: false
      find('label[for=type_kind_ミドル]').click
      expect(page).to have_checked_field with: 'ミドル', visible: false
      fill_in '機種名', with: @type.type_name
      #追加ボタンを押すとTypeモデルのカウントが1上がることを確認する
      expect{find('input[name="commit"]').click}.to change{Type.count}.by(1)
      #機種作成ページに遷移したことを確認する
      expect(current_path).to eq(types_path)
      #作成した機種名が追加されていることを確認する
      expect(page).to have_content(@type_store)
    end
  end
end

RSpec.describe '機種の編集', type: :system do

  before do
    @type1 = FactoryBot.create(:type)
  end

  context '機種の編集ができるとき' do
    it 'ログインしたユーザーは自分が登録した機種の編集ができる' do
      # type1を投稿したユーザーでログインする
      sign_in(@type1.user)
      # 機種ページへ遷移する
      visit types_path
      # type1に「編集」へのリンクがあることを確認する
      expect(page).to have_link '編集', href: edit_type_path(@type1)
      # 編集ページへ遷移する
      visit edit_type_path(@type1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(find('#type_type_name').value).to eq(@type1.type_name)
      expect(page).to have_checked_field with: "#{@type1.pachi_slot}", visible: false
      expect(page).to have_checked_field with: "#{@type1.kind}", visible: false
      # 投稿内容を編集する
      expect(page).to have_checked_field with: 'パチンコ', visible: false
      find('label[for=type_kind_ミドル]').click
      expect(page).to have_checked_field with: 'ミドル', visible: false
      fill_in '機種名', with: "#{@type1.type_name}+編集した機種名"
      # 編集してもTypeモデルのカウントは変わらないことを確認する
      expect{find('input[name="commit"]').click}.to change { Type.count }.by(0)
      # 機種ページに遷移したことを確認する
      expect(current_path).to eq types_path
      # 機種ページには先ほど変更した内容の機種名が存在することを確認する
      expect(page).to have_content("#{@type1.type_name}+編集した機種名")
    end
  end
end

RSpec.describe '機種削除', type: :system do

  before do
    @type1 = FactoryBot.create(:type)
  end

  context '機種を削除ができるとき' do
    it 'ログインしたユーザーは自らが登録した機種の削除ができる' do
      # type1を投稿したユーザーでログインする
      sign_in(@type1.user)
      # 機種ページへ遷移する
      visit types_path
      # type1に「削除」へのリンクがあることを確認する
      expect(page).to have_link '削除', href: type_path(@type1)
      #type1削除へのリンクをクリックする
      click_on '削除'
      #削除ボタンを押すとダイアログが出てくる
      page.driver.browser.switch_to.alert.accept
      # 機種ページに遷移したことを確認する
      expect(current_path).to eq types_path
      # 機種ページにはtype1の内容が存在しないことを確認する
      expect(page).to have_no_content("#{@type1.type_name}")
    end
  end
end

