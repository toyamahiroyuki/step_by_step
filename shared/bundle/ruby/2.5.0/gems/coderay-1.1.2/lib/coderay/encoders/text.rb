module CodeRay
  module Encoders
    # Concats the tokens into a single string, resulting in the original
    # code string if no tokens were removed.
    #
    # Alias: +plain+, +plaintext+
    #
    # == Options
    #
    # === :separator
    # A separator string to join the tokens.
    #
    # Default: empty String
    class Text < Encoder
      register_for :text

      FILE_EXTENSION = 'txt'.freeze

      DEFAULT_OPTIONS = {
        :separator => nil,
      }.freeze

      def text_token(text, kind)
        super

        if @sep
          if @first
            @first = false
          else
            @out << @sep
          end
        end
      end

      protected

      def setup(options)
        super

        @first = true
        @sep = options[:separator]
      end
    end
  end
end
