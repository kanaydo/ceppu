module Parser
  def parse_exeption(exception)
    {
      event_id: SecureRandom.uuid,
      level: 'error',
      message: exception.message,
      timestamp: Time.now.utc.strftime('%d-%m-%Y %H:%M:%S'),
      exception: {
        values: [
          {
            type: exception.class.name,
            value: exception.message,
            stacktrace: {
              frames: exception.backtrace&.map do |line|
                {
                  filename: line
                }
              end
            }
          }
        ]
      }
    }
  end

  def build_transport_payload(exception)
    [
      { event_id: event[:event_id], sent_at: Time.now.utc.iso8601 }.to_json,
      { type: 'event' }.to_json,
      parse_exeption(exception).to_json
    ].join("\n")
  end
end
