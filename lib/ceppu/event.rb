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

    def self.sample
      raise(StandardError, 'Sample Error')
    end
  end
end
