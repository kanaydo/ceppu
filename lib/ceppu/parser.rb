module Ceppu
  module Parser
    def parse_exeption(exception)
      {
        event_id: SecureRandom.uuid,
        level: 'error',
        message: exception.message,
        timestamp: Time.now.utc.strftime('%d-%m-%Y %H:%M:%S'),
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
    end
  end
end
