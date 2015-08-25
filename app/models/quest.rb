class Quest < ActiveRecord::Base
  has_and_belongs_to_many :modifier_instances
end
