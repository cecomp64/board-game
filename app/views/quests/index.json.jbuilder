json.array!(@quests) do |quest|
  json.extract! quest, :id, :title, :text, :draw, :roll
  json.url quest_url(quest, format: :json)
end
