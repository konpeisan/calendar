class Hall < ApplicationRecord
  has_many :budgets

  validates :store, presence: {message: 'を入力して下さい'}
end
