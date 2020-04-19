class Array
  unless method_defined?(:select!)
    def select! # :yield: x
      i = 0
      each_with_index do |x, j|
        yield x || next
        self[i] = x if i != j
        i += 1
      end
      return nil if i == size
      self[i..-1] = []
      self
    end
  end

  unless method_defined?(:sort_by!)
    def sort_by!(&block) # :yield: x
      replace(sort_by(&block))
    end
  end
end

class Hash
  class << self
    unless method_defined?(:try_convert)
      def try_convert(object)
        if object.is_a?(Hash) ||
            (object.respond_to?(:to_hash) && (object = object.to_hash).is_a?(Hash))
          object
        else
          nil
        end
      end
    end
  end
end

class String
  class << self
    unless method_defined?(:try_convert)
      def try_convert(object)
        if object.is_a?(String) ||
            (object.respond_to?(:to_str) && (object = object.to_str).is_a?(String))
          object
        else
          nil
        end
      end
    end
  end
end

# In Ruby < 1.9.3 URI() does not accept a URI object.
if RUBY_VERSION < "1.9.3"
  require 'uri'

  begin
    URI(URI(''))
  rescue
    def URI(url) # :nodoc:
      case url
      when URI
        url
      when String
        URI.parse(url)
      else
        raise ArgumentError, 'bad argument (expected URI object or URI string)'
      end
    end
  end
end
