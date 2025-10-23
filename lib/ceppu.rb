require 'ceppu/controller_methods'
# require 'ceppu/railtie' if defined?(Rails)

module Ceppu
  class Engine < Rails::Engine
    initializer 'ceppu.controller_methods' do
      ActiveSupport.on_load(:action_controller) do
        include Ceppu::ControllerMethods
      end
    end
  end
end
