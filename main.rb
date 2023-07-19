# frozen_string_literal: true

require_relative 'whatsapp'
require_relative 'ngrok'

Whatsapp::Chat.send_ngrok_url(ENV['WHATSAPP_NUMBER'], Ngrok::Tunnel.show_url)
