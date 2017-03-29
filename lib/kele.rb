require 'httparty'
#require 'json'

class Kele

  include HTTParty

  def initialize(email, password)
    @api_url = 'https://www.bloc.io/api/v1'
    response = self.class.post(@api_url + '/sessions', body: {"email": email, "password": password})
    puts "Success!"
    raise "Invalid credentials. Please try again!" if response.code != 200
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(@api_url + '/users/me', headers: { "authorization" => @auth_token })
    @current_user = JSON.parse(response.body)
  end

end
