json.array!(@games) do |game|
  json.extract! game, :id, :name, :winner_id
  json.url game_url(game, format: :json)
end
