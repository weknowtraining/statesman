# frozen_string_literal: true

module Kingsman
  class Railtie < ::Rails::Railtie
    railtie_name :kingsman

    rake_tasks do
      load "tasks/kingsman.rake"
    end
  end
end
