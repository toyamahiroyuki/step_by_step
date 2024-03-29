# frozen_string_literal: true

require "action_dispatch/journey/nfa/dot"

module ActionDispatch
  module Journey # :nodoc:
    module NFA # :nodoc:
      class TransitionTable # :nodoc:
        include Journey::NFA::Dot

        attr_accessor :accepting
        attr_reader :memos

        def initialize
          @table     = Hash.new { |h, f| h[f] = {} }
          @memos     = {}
          @accepting = nil
          @inverted  = nil
        end

        def accepting?(state)
          accepting == state
        end

        def accepting_states
          [accepting]
        end

        def add_memo(idx, memo)
          @memos[idx] = memo
        end

        def memo(idx)
          @memos[idx]
        end

        def []=(i, f, s)
          @table[f][i] = s
        end

        def merge(left, right)
          @memos[right] = @memos.delete(left)
          @table[right] = @table.delete(left)
        end

        def states
          (@table.keys + @table.values.flat_map(&:keys)).uniq
        end

        # Returns set of NFA states to which there is a transition on ast symbol
        # +a+ from some state +s+ in +t+.
        def following_states(t, a)
          Array(t).flat_map { |s| inverted[s][a] }.uniq
        end

        # Returns set of NFA states to which there is a transition on ast symbol
        # +a+ from some state +s+ in +t+.
        def move(t, a)
          Array(t).map do |s|
            inverted[s].keys.compact.find_all do |sym|
              sym === a
            end.map { |sym| inverted[s][sym] }
          end.flatten.uniq
        end

        def alphabet
          inverted.values.flat_map(&:keys).compact.uniq.sort_by(&:to_s)
        end

        # Returns a set of NFA states reachable from some NFA state +s+ in set
        # +t+ on nil-transitions alone.
        def eclosure(t)
          stack = Array(t)
          seen  = {}
          children = []

          until stack.empty?
            s = stack.pop
            next if seen[s]

            seen[s] = true
            children << s

            stack.concat(inverted[s][nil])
          end

          children.uniq
        end

        def transitions
          @table.flat_map do |to, hash|
            hash.map { |from, sym| [from, sym, to] }
          end
        end

        private

        def inverted
          return @inverted if @inverted

          @inverted = Hash.new do |h, from|
            h[from] = Hash.new { |j, s| j[s] = [] }
          end

          @table.each do |to, hash|
            hash.each do |from, sym|
              if sym
                sym = Nodes::Symbol === sym ? sym.regexp : sym.left
              end

              @inverted[from][sym] << to
            end
          end

          @inverted
        end
      end
    end
  end
end
