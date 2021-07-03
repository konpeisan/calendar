class Hall < ApplicationRecord
  belongs_to :budget, optional: true
end
