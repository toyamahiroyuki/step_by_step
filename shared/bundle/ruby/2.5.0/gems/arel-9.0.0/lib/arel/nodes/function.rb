# frozen_string_literal: true

module Arel
  module Nodes
    class Function < Arel::Nodes::Node
      include Arel::Predications
      include Arel::WindowPredications
      include Arel::OrderPredications
      attr_accessor :expressions, :alias, :distinct

      def initialize(expr, aliaz = nil)
        super()
        @expressions = expr
        @alias       = aliaz && SqlLiteral.new(aliaz)
        @distinct    = false
      end

      def as(aliaz)
        self.alias = SqlLiteral.new(aliaz)
        self
      end

      def hash
        [@expressions, @alias, @distinct].hash
      end

      def eql?(other)
        self.class == other.class &&
          expressions == other.expressions &&
          self.alias == other.alias &&
          distinct == other.distinct
      end
      alias :== :eql?
    end

    %w(
      Sum
      Exists
      Max
      Min
      Avg
    ).each do |name|
      const_set(name, Class.new(Function))
    end
  end
end
