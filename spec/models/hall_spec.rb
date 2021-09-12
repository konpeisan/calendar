require 'rails_helper'

RSpec.describe Hall, type: :model do
  before do
    @hall = FactoryBot.build(:hall)
  end

  describe 'ホール新規登録' do
    context '新規登録できる時' do
      it 'storeが存在すれば登録できる' do
        expect(@hall).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'storeが空では登録できない' do
        @hall.store = ''
        @hall.valid?
        expect(@hall.errors.full_messages).to include("ホール名を入力して下さい")
      end
    end
  end
end
