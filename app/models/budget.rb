class Budget < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :yen
  belongs_to :hall, optional: true
  belongs_to :type, optional: true
  has_one_attached :image

  validates :price, :recovery, presence: true
end
