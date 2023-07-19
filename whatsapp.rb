# frozen_string_literal: true

require 'json'
require_relative 'http_client'

module Whatsapp
  INSTANCE_ID = ENV['WHATSAPP_INSTANCE_ID']
  TOKEN = ENV['WHATSAPP_TOKEN']
  API_URL = "https://api.ultramsg.com/#{INSTANCE_ID}".freeze

  def self.chat_url
    @chat_url ||= "#{API_URL}/messages/chat"
  end

  class Chat
    def self.send_ngrok_url(to, body)
      HttpClient.post(
        Whatsapp.chat_url,
        body: { token: Whatsapp::TOKEN, to:, body: }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end
