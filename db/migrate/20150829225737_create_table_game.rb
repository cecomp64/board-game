class CreateTableGame < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :character_id
      t.integer :quest_id
      t.integer :space_id
      t.integer :points
    end

    create_join_table :helpers, :players do |t|
      t.index [:player_id, :helper_id]
    end

    create_table :games do |t|
      t.string :name
      t.integer :winner_id
      t.timestamps null: false
    end

    create_join_table :games, :players do |t|
      t.index [:game_id, :player_id]
    end
  end
end
