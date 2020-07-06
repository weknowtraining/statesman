# frozen_string_literal: true

require "rails/generators"
require "generators/kingsman/generator_helpers"

# Add kingsman attributes to a pre-existing transition class
module Kingsman
  class MigrationGenerator < Rails::Generators::Base
    include Kingsman::GeneratorHelpers

    desc "Add the required Kingsman attributes to your transition model"

    argument :parent, type: :string, desc: "Your parent model name"
    argument :klass, type: :string, desc: "Your transition model name"

    source_root File.expand_path("templates", __dir__)

    def create_model_file
      template("update_migration.rb.erb", file_name)
    end

    private

    def file_name
      "db/migrate/#{next_migration_number}_add_kingsman_to_#{table_name}.rb"
    end
  end
end
