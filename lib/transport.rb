module Transport
  def send_event(payload)
    uri = URI('http://localhost:3000')
    body = payload.to_json
    req = Net::HTTP::Post.new(uri)
    req['Content-Type'] = 'application/json'
    req['Authorization'] = 'Bearer your_token_here' # optional
    req.body = body

    Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(req)
    end

    # Net::HTTP.start('http://0.0.0.0', '3000') do |http|
    #   req = Net::HTTP::Post.new(
    #     uri, {
    #       'Content-Type' => 'application/json'
    #     }
    #   )
    #   req.body = payload
    #   http.request(req)
    # end
  end
end
