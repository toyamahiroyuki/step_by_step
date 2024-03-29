# frozen_string_literal: true

require "active_model/attribute"

module ActiveModel
  class Attribute # :nodoc:
    class UserProvidedDefault < FromUser # :nodoc:
      def initialize(name, value, type, database_default)
        @user_provided_value = value
        super(name, value, type, database_default)
      end

      def value_before_type_cast
        if user_provided_value.is_a?(Proc)
          @memoized_value_before_type_cast ||= user_provided_value.call
        else
          @user_provided_value
        end
      end

      def with_type(type)
        self.class.new(name, user_provided_value, type, original_attribute)
      end

      def marshal_dump
        result = [
          name,
          value_before_type_cast,
          type,
          original_attribute,
        ]
        result << value if defined?(@value)
        result
      end

      def marshal_load(values)
        name, user_provided_value, type, original_attribute, value = values
        @name = name
        @user_provided_value = user_provided_value
        @type = type
        @original_attribute = original_attribute
        if values.length == 5
          @value = value
        end
      end

      protected

      attr_reader :user_provided_value
    end
  end
end
