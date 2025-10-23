require 'rails'

initializer 'ceppu.ceppu_in' do
  ActiveSupport.on_load(:action_controller) do
    # Assuming YourGemName::ControllerMethods exists
    include Ceppu::ControllerMethods
    # You might also call 'helper YourGemName::RailsHelper' here
    # to make the view methods available to controller helper_methods
  end
end
