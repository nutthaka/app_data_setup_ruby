require 'net/http'
require 'json'
require_relative 'auth'

def create(token)
  http = Net::HTTP.new(ACCESS_SERVICE_HOST, PORT)
  request = Net::HTTP::Get.new("/response.json")
  request['Content-Type'] = "application/json"
  request['Authorization'] = "Bearer #{token}"
  response = http.request(request)
  token = JSON.parse(response.body)["token"]
end

puts "Object: " + create(get_token)
