# frozen_string_literal: true

require "spec_helper"

describe Kingsman::Guard do
  let(:callback) { -> {} }
  let(:guard) { described_class.new(from: nil, to: nil, callback: callback) }

  specify { expect(guard).to be_a(Kingsman::Callback) }

  describe "#call" do
    subject(:call) { guard.call }

    context "success" do
      let(:callback) { -> { true } }

      specify { expect { call }.to_not raise_error }
    end

    context "error" do
      let(:callback) { -> { false } }

      specify { expect { call }.to raise_error(Kingsman::GuardFailedError) }
    end
  end
end
