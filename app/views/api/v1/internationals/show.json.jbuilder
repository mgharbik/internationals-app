json.extract! @international, :id, :name, :country, :slug, :friends_count

json.friends @international.friends.ordered do |friend|
  json.extract! friend, :id, :name, :country, :slug
end

json.suggested_friends @international.suggested_friends.ordered do |friend|
  json.extract! friend, :id, :name, :country, :slug
end
