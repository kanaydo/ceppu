require 'net/http'
require 'json'
require 'uri'

require_relative 'parser'
require_relative 'transport'
require_relative 'store'

module Ceppu
  class Event
    extend Parser
    extend Transport
    extend Store

    def self.create_event(exception)
      payload = parse_exeption(exception)
      save_event(payload)
    end

    def self.sync_event(log)
      api_path = ENV.fetch('CEPPU_API_PATH', nil)
      api_key = ENV.fetch('CEPPU_API_KEY', nil)
      raise(StandardError, 'CEPPU_API_PATH nor CEPPU_API_KEY cannot be empty') if api_path.nil? || api_key.nil?

      params = parse_to_params(log)
      send_event(params)
    end

    def self.sample
      raise(StandardError, 'Sample Error')
    end
  end
end
