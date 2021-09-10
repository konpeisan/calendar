class Hall < ApplicationRecord
  has_many :budgets
  belongs_to :user

  validates :store, presence: {message: 'ホール名を入力して下さい'}
end
