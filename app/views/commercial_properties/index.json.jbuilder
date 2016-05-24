json.array!(@commercial_properties) do |commercial_property|
  json.extract! commercial_property, :id
  json.url commercial_property_url(commercial_property, format: :json)
end
