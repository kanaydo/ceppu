require 'rails'
require_relative 'controller_methods'

module Ceppu
  class Railtie < Rails::Railtie
    initializer 'ceppu.ceppu_in' do
      ActiveSupport.on_load(:action_controller) do
        include Ceppu::ControllerMethods
      end
    end
  end
end
