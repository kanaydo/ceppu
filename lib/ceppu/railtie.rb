require 'rails'

module Ceppu
  class Railtie < Rails::Railtie
    initializer 'ceppu.ceppu_in' do
      ActiveSupport.on_load(:action_controller) do
        include Ceppu::ControllerMethods

        helper_method :ceppu_in
      end
    end
  end
end
