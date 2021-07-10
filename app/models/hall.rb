class Hall < ApplicationRecord
  has_many :budgets

  validates :store, presence: {message: 'ホール名を入力して下さい'}
end
