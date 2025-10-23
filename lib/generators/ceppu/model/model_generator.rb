# frozen_string_literal: true

require 'rails/generators/named_base'
require 'rails/generators/active_record'

module Ceppu
  module Generators
    # 💡 Note the change: Inherits from Rails::Generators::Base
    class ModelGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('templates', __dir__)

      def self.next_migration_number(dirname)
        ::ActiveRecord::Generators::Base.next_migration_number(dirname)
      end

      # --- Generator Actions ---

      # 1. Define Model Names and Variables
      # Since we aren't using command-line input, we define variables
      # based on the static names you want in your template.
      def set_model_and_migration_variables
        @model_name = 'CeppuLog'
        @table_name = 'ceppu_logs'
      end

      def create_model_file
        # We use our custom instance variable for the file path
        template 'ceppu.rb.tt', File.join('app/models', "#{@model_name.underscore}.rb")
      end

      def create_migration_file
        # We use a static migration file name
        migration_template 'create_ceppu_logs.rb.tt', "db/migrate/create_#{@table_name}.rb"
      end
    end
  end
end
