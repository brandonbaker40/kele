require 'httparty'
require 'json'
require './lib/roadmap'

class Kele

  include HTTParty
  include Roadmap

  def initialize(email, password)
    @api_url = 'https://www.bloc.io/api/v1'
    response = self.class.post(@api_url + "/sessions", body: {"email": email, "password": password})
    puts "Success!"
    raise "Invalid credentials. Please try again!" if response.code != 200
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(@api_url + "/users/me", headers: { "authorization" => @auth_token })
    @current_user = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get(@api_url + "/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })
    @mentor_availability = JSON.parse(response.body)
  end

  def get_messages(page_number)
    response = self.class.get(@api_url + "/message_threads", headers: { "authorization" => @auth_token })
    @get_messages = JSON.parse(response.body)
  end

  def create_message(sender, recipient_id, subject, message)
    response = self.class.post(@api_url + "/messages", body: {"sender": sender, "recipient_id": recipient_id, "subject": subject, "stripped-text": message}, headers: { "authorization" => @auth_token })
    @create_message = response["success"]
  end

end
