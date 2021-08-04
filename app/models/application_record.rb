class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  require 'date'
  require 'holiday_jp'
end
