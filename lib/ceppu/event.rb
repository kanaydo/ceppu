require 'net/http'
require 'json'
require 'uri'

require_relative 'parser'
require_relative 'transport'

module Ceppu
  class Event
    extend Parser
    extend Transport

    def self.create_event(exception)
      payload = parse_exeption(exception)
      send_event(payload)
    end

    def self.sample
      raise(StandardError, 'Sample Error')
    end
  end
end
