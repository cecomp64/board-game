class Game < ActiveRecord::Base
  has_and_belongs_to_many :players
  belongs_to :current_player, class_name: "Player"

  has_and_belongs_to_many :quest_discards, join_table: :quest_discard_piles, class_name: "Quest"
  has_and_belongs_to_many :helper_discards, join_table: :helper_discard_piles, class_name: "Helper"
end
