# frozen_string_literal: true

require_relative "callback"
require_relative "exceptions"

module Kingsman
  class Guard < Callback
    def call(*args)
      raise GuardFailedError.new(from, to) unless super(*args)
    end
  end
end
