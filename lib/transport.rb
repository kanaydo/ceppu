module Transport
  def self.send_event(payload)
    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      req = Net::HTTP::Post.new(
        uri, {
          'Content-Type' => 'application/json'
        }
      )
      req.body = payload
      http.request(req)
    end
  end
end
