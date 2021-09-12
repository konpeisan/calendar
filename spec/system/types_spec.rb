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

