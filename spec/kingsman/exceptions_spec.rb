# frozen_string_literal: true

require "spec_helper"

describe Kingsman do
  describe "InvalidStateError" do
    subject(:error) { Kingsman::InvalidStateError.new }

    its(:message) { is_expected.to eq("Kingsman::InvalidStateError") }
    its "string matches its message" do
      expect(error.to_s).to eq(error.message)
    end
  end

  describe "InvalidTransitionError" do
    subject(:error) { Kingsman::InvalidTransitionError.new }

    its(:message) { is_expected.to eq("Kingsman::InvalidTransitionError") }
    its "string matches its message" do
      expect(error.to_s).to eq(error.message)
    end
  end

  describe "InvalidCallbackError" do
    subject(:error) { Kingsman::InvalidTransitionError.new }

    its(:message) { is_expected.to eq("Kingsman::InvalidTransitionError") }
    its "string matches its message" do
      expect(error.to_s).to eq(error.message)
    end
  end

  describe "TransitionConflictError" do
    subject(:error) { Kingsman::TransitionConflictError.new }

    its(:message) { is_expected.to eq("Kingsman::TransitionConflictError") }
    its "string matches its message" do
      expect(error.to_s).to eq(error.message)
    end
  end

  describe "MissingTransitionAssociation" do
    subject(:error) { Kingsman::MissingTransitionAssociation.new }

    its(:message) { is_expected.to eq("Kingsman::MissingTransitionAssociation") }
    its "string matches its message" do
      expect(error.to_s).to eq(error.message)
    end
  end

  describe "TransitionFailedError" do
    subject(:error) { Kingsman::TransitionFailedError.new("from", "to") }

    its(:message) { is_expected.to eq("Cannot transition from 'from' to 'to'") }
    its "string matches its message" do
      expect(error.to_s).to eq(error.message)
    end
  end

  describe "GuardFailedError" do
    subject(:error) { Kingsman::GuardFailedError.new("from", "to") }

    its(:message) do
      is_expected.to eq("Guard on transition from: 'from' to 'to' returned false")
    end
    its "string matches its message" do
      expect(error.to_s).to eq(error.message)
    end
  end

  describe "UnserializedMetadataError" do
    subject(:error) { Kingsman::UnserializedMetadataError.new("foo") }

    its(:message) { is_expected.to match(/foo#metadata is not serialized/) }
    its "string matches its message" do
      expect(error.to_s).to eq(error.message)
    end
  end

  describe "IncompatibleSerializationError" do
    subject(:error) { Kingsman::IncompatibleSerializationError.new("foo") }

    its(:message) { is_expected.to match(/foo#metadata column type cannot be json/) }
    its "string matches its message" do
      expect(error.to_s).to eq(error.message)
    end
  end
end
