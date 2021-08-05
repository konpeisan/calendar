class Budget < ApplicationRecord
  belongs_to :hall, optional: true
  belongs_to :type, optional: true
  has_one_attached :image

  validates :price, presence: {message: '投資を入力して下さい'}
  validates :recovery, presence: {message: '回収を入力して下さい'}
end
