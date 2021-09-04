require 'rails_helper'

RSpec.describe Type, type: :model do
  before do
    @type = FactoryBot.build(:type)
  end

  describe '機種新規登録' do
    context '新規登録できる時' do
      it 'type_nameが存在すれば登録できる' do
        expect(@type).to be_valid
      end
      it 'pachi_slotが存在すれば登録できる' do
        expect(@type).to be_valid
      end
      it 'kindが存在すれば登録できる' do
        expect(@type).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'type_nameが空だと登録できない' do
        @type.type_name = ''
        @type.valid?
        expect(@type.errors.full_messages).to include("機種名を入力して下さい")
      end
      it 'pachi_slotが空だと登録できない' do
        @type.pachi_slot = ''
        @type.valid?
        expect(@type.errors.full_messages).to include("種類を選択して下さい")
      end
      it 'kindが空だと登録できない' do
        @type.kind = ''
        @type.valid?
        expect(@type.errors.full_messages).to include("タイプを選択して下さい")
      end
    end
  end
end
