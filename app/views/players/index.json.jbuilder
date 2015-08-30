json.array!(@players) do |player|
  json.extract! player, :id, :space_id, :character_id, :quest_id, :points
  json.url player_url(player, format: :json)
end
