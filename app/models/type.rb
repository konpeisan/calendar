class Type < ApplicationRecord
  has_many :budgets
  belongs_to :user

  validates :type_name, presence: {message: '機種名を入力して下さい'}
  validates :pachi_slot, presence: {message: '種類を選択して下さい'}
  validates :kind, presence: {message: 'タイプを選択して下さい'}
end
