# frozen_string_literal: true

require "spec_helper"
require "kingsman/adapters/shared_examples"
require "kingsman/adapters/memory_transition"

describe Kingsman::Adapters::Memory do
  let(:model) { Class.new { attr_accessor :current_state }.new }

  it_behaves_like "an adapter", described_class,
                  Kingsman::Adapters::MemoryTransition
end
