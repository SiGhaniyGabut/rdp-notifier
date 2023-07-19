# frozen_string_literal: true

require 'net/http'
require 'uri'

class HttpClient
  def self.get(url, headers: {})
    Net::HTTP.get(URI(url), headers)
  end

  def self.post(url, body: {}, headers: {})
    Net::HTTP.post(URI(url), body, headers)
  end
end
