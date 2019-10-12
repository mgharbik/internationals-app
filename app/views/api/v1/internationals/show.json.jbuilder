json.extract! @international, :id, :name, :country, :slug, :friends_count

json.friends @international.friends do |friend|
  json.extract! friend, :id, :name, :country, :slug, :friends_count
end

json.suggested_friends @international.suggested_friends do |friend|
  json.extract! friend, :id, :name, :country, :slug, :friends_count
end
