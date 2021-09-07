require 'rails_helper'

RSpec.describe "機種登録", type: :system do
  
  before do
    @budget = FactoryBot.build(:budget)
    @type_type_name = Faker::Name.initials(number: 5)
  end

  context '機種登録ができる時' do
    it '機種を追加することができる' do
      #トップページへ遷移する
      visit root_path
      #トップページに機種作成ページへのボタンがあることを確認する
      expect(page).to have_content("機種名")
      #機種作成ページに遷移する
      visit types_path
      #種類、タイプを選択し、機種名を入力する
      expect(page).to have_checked_field with: 'パチンコ', visible: false
      find('label[for=type_kind_ミドル]').click
      expect(page).to have_checked_field with: 'ミドル', visible: false
      fill_in '機種名', with: @type_type_name
      #追加ボタンを押すとTypeモデルのカウントが1上がることを確認する
      expect{find('input[name="commit"]').click}.to change{Type.count}.by(1)
      #機種作成ページに遷移したことを確認する
      expect(current_path).to eq(types_path)
      #作成した機種名が追加されていることを確認する
      expect(page).to have_content(@type_store)
    end
  end
end

RSpec.describe "機種編集", type: :system do

  before do
    @type1 = FactoryBot.create(:type)
  end

  context '機種名を編集できる時' do
    it '登録した機種名を編集することができる' do
      #ホール作成ページへ遷移する
      visit types_path
      #作成された機種名に編集へのリンクがあることを確認する
      expect(page).to have_link '編集', href: edit_type_path(@type1)
      #編集ページへ遷移する
      visit edit_type_path(@type1)
      #すでに登録済みの機種名が入っていることを確認する
      expect(find('#type_type_name').value).to eq(@type1.type_name)
      #機種名を編集する
      expect(page).to have_checked_field with: 'パチンコ', visible: false
      find('label[for=type_kind_ライトミドル]').click
      expect(page).to have_checked_field with: 'ライトミドル', visible: false
      fill_in 'type_type_name', with: "#{@type1.type_name}+編集した機種名"
      #編集してもTypeモデルのカウントは変わらないことを確認する
      expect{find('input[name="commit"]').click}.to change{Type.count}.by(0)
      #機種作成ページに遷移したことを確認する
      expect(current_path).to eq(types_path)
      #機種作成ページには先ほど変更したホール名が存在することを確認する
      expect(page).to have_content("#{@type1.type_name}+編集した機種名")
    end
  end
end

RSpec.describe "機種削除", type: :system do

  before do
    @type1 = FactoryBot.create(:type)
  end

  context '機種を削除できる時' do
    it '登録した機種名を削除できる' do
      #ホール作成ページに遷移する
      visit types_path
      #作成されたホール名に削除へのリンクがあることを確認する
      expect(page).to have_link '削除', href: type_path(@type1)
      #削除ボタンを押すとダイアログが出てくる
      page.accept_confirm do
        click_on '削除'
      end
      #ホール作成ページに遷移したことを確認する
      expect(current_path).to eq(types_path)
      #ホール作成ページには先ほどのホール１が存在しないことを確認する
      expect(page).to have_no_content("#{@type1.type_name}")
    end
  end
end
