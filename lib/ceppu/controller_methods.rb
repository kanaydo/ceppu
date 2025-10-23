require_relative 'event'

module Ceppu
  module ControllerMethods
    def ceppu_in(exception)
      Event.create_event(exception)
      raise(exception)
    end
  end
end
