# frozen_string_literal: true

module Kingsman
  class InvalidStateError < StandardError; end
  class InvalidTransitionError < StandardError; end
  class InvalidCallbackError < StandardError; end
  class TransitionConflictError < StandardError; end
  class MissingTransitionAssociation < StandardError; end

  class TransitionFailedError < StandardError
    def initialize(from, to)
      @from = from
      @to = to
      super(_message)
    end

    attr_reader :from, :to

    private

    def _message
      "Cannot transition from '#{from}' to '#{to}'"
    end
  end

  class GuardFailedError < StandardError
    def initialize(from, to)
      @from = from
      @to = to
      super(_message)
    end

    attr_reader :from, :to

    private

    def _message
      "Guard on transition from: '#{from}' to '#{to}' returned false"
    end
  end

  class UnserializedMetadataError < StandardError
    def initialize(transition_class_name)
      super(_message(transition_class_name))
    end

    private

    def _message(transition_class_name)
      "#{transition_class_name}#metadata is not serialized. If you " \
      "are using a non-json column type, you should `include " \
      "Kingsman::Adapters::ActiveRecordTransition`"
    end
  end

  class IncompatibleSerializationError < StandardError
    def initialize(transition_class_name)
      super(_message(transition_class_name))
    end

    private

    def _message(transition_class_name)
      "#{transition_class_name}#metadata column type cannot be json " \
      "and serialized simultaneously. If you are using a json " \
      "column type, it is not necessary to `include " \
      "Kingsman::Adapters::ActiveRecordTransition`"
    end
  end
end
