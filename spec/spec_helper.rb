require 'webmock/rspec'

# Block all real HTTP requests
WebMock.disable_net_connect!(allow_localhost: true)
