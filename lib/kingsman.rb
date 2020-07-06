# frozen_string_literal: true

module Kingsman
  autoload :Config,     "kingsman/config"
  autoload :Machine,    "kingsman/machine"
  autoload :Callback,   "kingsman/callback"
  autoload :Guard,      "kingsman/guard"
  autoload :Utils,      "kingsman/utils"
  autoload :Version,    "kingsman/version"
  module Adapters
    autoload :Memory,       "kingsman/adapters/memory"
    autoload :ActiveRecord, "kingsman/adapters/active_record"
    autoload :ActiveRecordTransition,
             "kingsman/adapters/active_record_transition"
    autoload :ActiveRecordQueries,
             "kingsman/adapters/active_record_queries"
  end
  require "kingsman/railtie" if defined?(::Rails::Railtie)

  # Example:
  #   Kingsman.configure do
  #     storage_adapter Kingsman::ActiveRecordAdapter
  #     enable_mysql_gaplock_protection
  #   end
  #
  def self.configure(&block)
    @config = Config.new(block)
    @storage_adapter = config.adapter_class
  end

  def self.storage_adapter
    @storage_adapter || Adapters::Memory
  end

  def self.mysql_gaplock_protection?
    return @mysql_gaplock_protection unless @mysql_gaplock_protection.nil?

    @mysql_gaplock_protection = config.mysql_gaplock_protection?
  end

  def self.config
    @config ||= Config.new
  end
end
