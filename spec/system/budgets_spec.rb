require 'rails_helper'

RSpec.describe "収支登録", type: :system do
  
  before do
    @budget = FactoryBot.build(:budget)
  end

  context '収支新規登録できる時' do
    it '正しい情報を入力すれば収支を登録ができてトップページへ移動する' do
      #トップページへ移動する
      visit root_path
      #カレンダーのマスから結果作成のボタンがあることを確認する
      first('tbody tr').hover
      #結果作成ページに移動する
      #visit new_budget_path
      #収支情報を入力する
      #fill_in '日付', with: @budget.start_time
      #fill_in 'ホール名', with: @budget.store_id
      #fill_in '機種名', with: @budget.type_name_id
      #fill_in '投資', with: @budget.price
      #fill_in '回収', with: @budget.recovery
      #fill_in '本日の収支', with: @budget.total
      #fill_in '遊技時間', with: @budget.game_hour
      #fill_in '遊技時間', with: @budget.game_minute
      #fill_in 'メモ', with: @budget.memo
      #保存ボタンを押すとトップページへ遷移する
      expect(current_path).to eq(root_path)
    end
  end
end
