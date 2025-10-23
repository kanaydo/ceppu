require 'rails'

module Ceppu
  class Railtie < Rails::Railtie
    initializer 'ceppu.ceppu_in' do
      ActiveSupport.on_load(:action_controller) do
        include ControllerMethods
      end
    end
  end
end
