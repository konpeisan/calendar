class Budget < ApplicationRecord
  belongs_to :hall, optional: true
  belongs_to :type, optional: true
end
