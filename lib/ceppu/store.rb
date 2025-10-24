module Ceppu
  module Store
    def save_event(payload)
      CeppuLog.create(payload)
    end
  end
end
