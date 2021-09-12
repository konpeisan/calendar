require 'rails_helper'

RSpec.describe Budget, type: :model do
  before do
    @budget = FactoryBot.build(:budget)
  end

  describe '収支新規登録' do
    context '新規登録できる時' do
      it 'start_time,price,recovery,total,memo,store_id,type_name_id,game_hour,game_minuteがあれば登録できる' do
        expect(@budget).to be_valid
      end
      it 'start_time,price,recovery,totalのみで登録できる' do
        @budget.memo = ''
        @budget.store_id = ''
        @budget.type_name_id = ''
        @budget.game_hour = ''
        @budget.game_minute = ''
        expect(@budget).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'start_timeがないと登録できない' do
        @budget.start_time = ''
        @budget.valid?
        expect(@budget.errors.full_messages).to include()
      end
      it 'priceがないと登録できない' do
        @budget.price = ''
        @budget.valid?
        expect(@budget.errors.full_messages).to include("は数値で入力してください")
      end
      it 'recoveryがないと登録できない' do
        @budget.recovery = ''
        @budget.valid?
        expect(@budget.errors.full_messages).to include("は数値で入力してください")
      end
      it 'totalがないと登録できない' do
        @budget.total = ''
        @budget.valid?
        expect(@budget.errors.full_messages).to include()
      end
    end
  end
end
