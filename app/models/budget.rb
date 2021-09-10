class Budget < ApplicationRecord
  belongs_to :hall, optional: true
  belongs_to :type, optional: true
  belongs_to :user

  validates :price, numericality: true
  validates :recovery, numericality: true
end
