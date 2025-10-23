require 'net/http'
require 'json'
require 'uri'

if defined?(Rails) # rubocop:disable Style/IfUnlessModifier
  require 'ceppu/railtie'
end

module Ceppu
end
