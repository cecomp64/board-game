json.array!(@modifier_instances) do |modifier_instance|
  json.extract! modifier_instance, :id, :geography_id, :space_id, :modifier_id, :character_id, :character
  json.url modifier_instance_url(modifier_instance, format: :json)
end
