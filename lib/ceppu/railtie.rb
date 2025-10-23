require 'rails'

module Ceppu
  class Railtie < Rails::Railtie
    initializer 'ceppu.controller_methods' do
      ActiveSupport.on_load(:action_controller) do
        include Ceppu::ControllerMethods
      end
    end
  end
end
