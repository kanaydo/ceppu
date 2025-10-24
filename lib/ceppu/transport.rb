module Ceppu
  module Transport
    def send_event(payload)
      uri = URI(ENV.fetch('CEPPU_API_PATH'))
      body = payload.to_json
      req = Net::HTTP::Post.new(uri)
      req['Content-Type'] = 'application/json'
      req['Authorization'] = "Token #{ENV.fetch('CEPPU_API_KEY')}"
      req.body = body

      Thread.new do
        Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request(req)
        end
      end
    end
  end
end
