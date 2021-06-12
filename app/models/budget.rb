class Budget < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :yen
  has_one_attached :image

  validates :price, :recovery, presence: true
end
