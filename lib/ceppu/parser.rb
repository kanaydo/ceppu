module Ceppu
  module Parser
    def parse_exeption(exception)
      {
        event_id: SecureRandom.uuid,
        level: 'error',
        message: exception.message,
        timestamp: Time.zone.now,
        class_name: exception.class.name,
        stacktrace: {
          frames: exception.backtrace&.map do |line|
            {
              filename: line
            }
          end
        }
      }
    end

    def parse_to_params(log)
      {
        event_id: log.event_id,
        level: log.level,
        message: log.message,
        timestamp: log.timestamp.strftime('%d-%m-%Y %H:%M:%S'),
        class_name: log.class_name,
        stacktrace: log.stacktrace
      }
    end
  end
end
