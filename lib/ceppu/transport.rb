module Ceppu
  module Transport
    def send_event(payload)
      uri = URI('http://localhost:6969')
      body = payload.to_json
      req = Net::HTTP::Post.new(uri)
      req['Content-Type'] = 'application/json'
      # req['Authorization'] = 'Bearer your_token_here' # optional
      req.body = body

      Thread.new do
        Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request(req)
        end
      end
    end
  end
end
