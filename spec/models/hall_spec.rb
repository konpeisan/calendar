require 'rails_helper'

RSpec.describe Hall, type: :model do
  describe 'ホール新規登録' do
    it 'storeが空では登録できない' do
      hall = FactoryBot.build(:hall)
      hall.store = ''
      hall.valid?
      expect(hall.errors.full_messages).to include("ホール名を入力して下さい")
    end
  end
end
