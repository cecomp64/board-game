json.array!(@helpers) do |helper|
  json.extract! helper, :id, :title, :text
  json.url helper_url(helper, format: :json)
end
