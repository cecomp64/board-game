json.array!(@spaces) do |space|
  json.extract! space, :id, :name, :geography_id
  json.url space_url(space, format: :json)
end
