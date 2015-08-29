class Modifier < ActiveRecord::Base
  has_many :modifier_instance
  has_and_belongs_to_many :tags

  def to_words
    description = ""
    description += (roll && roll!=0) ? ((roll > 0) ? "Add #{roll} to your roll.  " : "Subtract #{roll.abs} from your roll.  ") : ""
    description += (draw && draw != 0) ? ((draw > 0) ? "Draw #{draw} additional #{BoardGame::HELPER_CARD_NAME} #{'card'.pluralize draw}.  " : "Discard #{draw.abs} #{BoardGame::HELPER_CARD_NAME} #{'card'.pluralize draw.abs}.  ") : ""
    description += (draw_other && draw_other != 0) ? ((draw_other > 0) ? "Choose one other player to draw #{draw_other} additional #{BoardGame::HELPER_CARD_NAME} #{'card'.pluralize draw_other}.  " : "Choose one other player to discard #{draw_other.abs} #{BoardGame::HELPER_CARD_NAME} #{'card'.pluralize draw_other.abs}.  ") : ""
    description += (draw_other_all && draw_other_all != 0) ? ((draw_other_all > 0) ? "All other players draw #{draw_other_all} additional #{BoardGame::HELPER_CARD_NAME} #{'card'.pluralize draw_other_all}.  " : "All other players discard #{draw_other_all.abs} #{BoardGame::HELPER_CARD_NAME} #{'card'.pluralize draw_other_all.abs}.  ") : ""
    description += (move && move!=0) ? ((move > 0) ? "Move ahead #{move} #{'space'.pluralize move}.  Do not move past the first space of the next Quest.  " : "Move back #{move.abs} #{'space'.pluralize move.abs}.  Do not move past the first space of the current Quest.  ") : ""
    description += (turn && turn!=0) ? ((turn > 0) ? "Take #{turn} more #{'turn'.pluralize turn} immediately after the current turn.  " : "Lose #{turn.abs} #{'turn'.pluralize turn.abs}.  If it is your turn, that counts.  ") : ""
    description += (banked_turns && banked_turns!=0) ? ((banked_turns > 0) ? "Collect #{banked_turns} Future Turn #{'token'.pluralize banked_turns}.  " : "Lose #{banked_turns.abs} Future Turn #{'token'.pluralize banked_turns.abs} (if you have any).  ") : ""
    description += (move_other && move_other!=0) ? ((move_other > 0) ? "Move other players forward #{move_other} #{'space'.pluralize move_other}.  " : "Move other players back #{move_other.abs} #{'space'.pluralize move_other.abs}.  ") : ""

    return description
  end

  def balance
    return (roll + draw + move + turn + banked_turns - (move_other + draw_other + draw_other_all))
  end

  def good?
    return (balance > 0)
  end

  def bad?
    return (balance < 0)
  end

  def nuetral?
    return (balance == 0)
  end
end
