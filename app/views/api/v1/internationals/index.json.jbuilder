json.array! @internationals do |international|
  json.extract! international, :id, :name, :country, :slug, :friends_count
end
