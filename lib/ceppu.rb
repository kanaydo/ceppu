require 'net/http'
require 'json'
require 'uri'

if defined?(Rails) # rubocop:disable Style/IfUnlessModifier
  require 'ceppu/railtie'
end

module Ceppu
  # extend Parser
  # extend Transport
  #
  # def self.create_report(exception)
  #   payload = parse_exeption(exception)
  #   send_event(payload)
  # end

  # def self.sample
  #   raise(StandardError, 'Sample Error')
  # end
end
