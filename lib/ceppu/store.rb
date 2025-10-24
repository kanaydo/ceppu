module Ceppu
  module Store
    def save_event(payload)
      Thread.new do
        CeppuLog.create(payload)
      end
    end
  end
end
