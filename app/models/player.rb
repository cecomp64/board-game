class Player < ActiveRecord::Base
  has_and_belongs_to_many :games
  has_and_belongs_to_many :helpers
  belongs_to :quest

  def reset
    self.points = 0
    self.quest = nil
    self.helpers = []
    self.save
  end
end
