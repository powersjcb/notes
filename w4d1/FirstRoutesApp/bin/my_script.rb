require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/8'
).to_s
begin
  puts RestClient.get(url)
  puts RestClient.patch(
    url,
    {user: {name: "Gizmo", email: "different_email@gmail.com" }}
  )
rescue RestClient::UnprocessableEntity => e
  puts e.message
end

puts RestClient.delete(url)
# puts RestClient.get(url)
