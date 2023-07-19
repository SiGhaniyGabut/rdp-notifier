# frozen_string_literal: true

require 'addressable'
require 'json'
require_relative 'http_client'

# Used for Ngrok integration.
module Ngrok
  # Used to get tunnel interface from Ngrok.
  module Tunnel
    def self.show_url
      <<~TEXT
        *Incoming message from #{ENV['COMPUTERNAME']}*

        ----------------------------------
        Use the following details to connect to the remote machine:

        *RDP Hostname*
        ```#{Ngrok.tunnel_hostname}```

        *RDP Port*
        ```#{Ngrok.tunnel_port}```
        ----------------------------------

        Sent at: #{Time.now}
      TEXT
    end

    def self.public_url
      details['tunnels'].first['public_url']
    end

    def self.details
      JSON.parse HttpClient.get('http://localhost:4040/api/tunnels')
    end

    private_class_method :details
  end

  def self.tunnel_hostname
    Addressable::URI.parse(Tunnel.public_url).hostname
  end

  def self.tunnel_port
    Addressable::URI.parse(Tunnel.public_url).port
  end
end
