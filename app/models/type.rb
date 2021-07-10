class Type < ApplicationRecord
  has_many :budgets

  validates :type_name, presence: {message: 'を入力して下さい'}
  validates :pachi_slot, presence: {message: 'を選択して下さい'}
  validates :kind, presence: {message: 'を選択して下さい'}
end
