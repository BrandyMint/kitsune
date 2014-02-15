class Language < ActiveRecord::Base
  validates :name, :code, :presence => true
end
