class Helper < ActiveRecord::Base
  has_and_belongs_to_many :modifier_instances
  has_and_belongs_to_many :tags
end
