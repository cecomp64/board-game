class AddTimestampsToGamesPlayers < ActiveRecord::Migration
  def change
    add_column(:games_players, :created_at, :datetime)
  end
end
