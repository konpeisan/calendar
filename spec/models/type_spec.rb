require 'rails_helper'

RSpec.describe Type, type: :model do
  before do
    @type = FactoryBot.build(:type)
  end

  describe '機種新規登録' do
    context '新規登録できる時' do
      it 'type_nameが存在すれば登録できる' do
      end
      it 'pachi_slotが存在すれば登録できる' do
      end
      it 'kindが存在すれば登録できる' do
      end
    end

    context '新規登録できない時' do
      it 'type_nameが空だと登録できない' do
      end
      it 'pachi_slotが空だと登録できない' do
      end
      it 'kindが空だと登録できない' do
      end
    end
  end
end
