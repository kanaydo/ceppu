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

    def parse_as_http_params(exception)
      params = parse_exeption(exception)
      params[:timestamp] = params[:timestamp].strftime('%d-%m-%Y %H:%M:%S')
      params
    end
  end
end
