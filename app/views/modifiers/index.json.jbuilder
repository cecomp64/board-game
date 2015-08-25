json.array!(@modifiers) do |modifier|
  json.extract! modifier, :id, :space_id, :geography_id, :name, :roll, :draw, :move, :turn, :banked_turns
  json.url modifier_url(modifier, format: :json)
end
