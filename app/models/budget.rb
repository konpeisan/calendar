class Budget < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :yen
  belongs_to :hall, dependent: :destroy, optional: true
  has_one_attached :image

  validates :price, :recovery, presence: true
end
