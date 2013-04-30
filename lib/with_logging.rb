require 'pry'
require 'log4r'
require "with_logging/version"

module WithLogging
  extend ActiveSupport::Concern

  included do
    ActiveRecord::Relation::SINGLE_VALUE_METHODS << :with_logging
    attr_accessor :with_logging_value
    alias_method_chain :build_arel, :logging
  end

  def build_arel_with_logging
    arel = build_arel_without_logging
    if @with_logging_value
      Log4r::MDC.put("logging_#{arel.to_sql}", @with_logging_value)
    end
    arel
  end

  def with_logging(value = true)
    @with_logging_value = @with_logging_value || value
    relation = clone
    relation
  end
end

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Relation.__send__(:include, WithLogging)
end
