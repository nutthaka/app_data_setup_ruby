require 'net/http'
require 'json'

ACCESS_SERVICE_HOST = "localhost"
PORT = 8000
CLIENT_ID = "client1"
SECRET = "secret1"

def get_token
  http = Net::HTTP.new(ACCESS_SERVICE_HOST, PORT)
  request = Net::HTTP::Get.new("/response.json")
  request.basic_auth(CLIENT_ID, SECRET)
  response = http.request(request)
  token = JSON.parse(response.body)["token"]
end
