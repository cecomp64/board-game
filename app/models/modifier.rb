class Modifier < ActiveRecord::Base
  has_many :modifier_instance
  has_and_belongs_to_many :tags

  def to_words
    description = ""
    description += (roll && roll!=0) ? ((roll > 0) ? "Add #{roll} to your roll.  " : "Subtract #{roll.abs} from your roll.  ") : ""
    description += (draw && draw != 0) ? ((draw > 0) ? "Draw #{draw} additional #{BoardGame::HELPER_CARD_NAME} #{'card'.pluralize draw}.  " : "Discard #{draw.abs} #{BoardGame::HELPER_CARD_NAME} #{'card'.pluralize draw.abs}.  ") : ""
    description += (move && move!=0) ? ((move > 0) ? "Move ahead #{move} #{'space'.pluralize move}.  Do not move past the first space of the next Quest.  " : "Move back #{move.abs} #{'space'.pluralize move.abs}.  Do not move past the first space of the current Quest.  ") : ""
    description += (turn && turn!=0) ? ((turn > 0) ? "Take #{turn} more #{'turn'.pluralize turn} immediately after the current turn.  " : "Lose #{turn.abs} #{'turn'.pluralize turn.abs}.  If it is your turn, that counts.  ") : ""
    description += (banked_turns && banked_turns!=0) ? ((banked_turns > 0) ? "Collect #{banked_turns} Future Turn #{'token'.pluralize banked_turns}.  " : "Lose #{banked_turns.abs} Future Turn #{'token'.pluralize banked_turns.abs} (if you have any).  ") : ""

    return description
  end
end
