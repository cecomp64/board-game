class CreateDiscardPile < ActiveRecord::Migration
  def change
    create_table :quest_discard_piles do |t|
      t.integer :game_id
      t.integer :quest_id
      t.index [:game_id, :quest_id]
    end

    create_table :helper_discard_piles do |t|
      t.integer :game_id
      t.integer :helper_id
      t.index [:game_id, :helper_id]
    end
  end
end
