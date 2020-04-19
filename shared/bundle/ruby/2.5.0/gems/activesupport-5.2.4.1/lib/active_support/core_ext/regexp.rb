# frozen_string_literal: true

class Regexp #:nodoc:
  def multiline?
    options & MULTILINE == MULTILINE
  end

  unless //.respond_to?(:match?)
    def match?(string, pos = 0)
      !!match(string, pos)
    end
  end
end
