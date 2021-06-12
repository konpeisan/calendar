class Budget < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :yen

  validates :price, :recovery, presence: true
end
