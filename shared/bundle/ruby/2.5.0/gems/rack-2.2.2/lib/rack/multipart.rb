# frozen_string_literal: true

require_relative 'multipart/parser'

module Rack
  # A multipart form data parser, adapted from IOWA.
  #
  # Usually, Rack::Request#POST takes care of calling this.
  module Multipart
    autoload :UploadedFile, 'rack/multipart/uploaded_file'
    autoload :Generator, 'rack/multipart/generator'

    EOL = "\r\n"
    MULTIPART_BOUNDARY = "AaB03x"
    MULTIPART = %r{\Amultipart/.*boundary=\"?([^\";,]+)\"?}ni.freeze
    TOKEN = /[^\s()<>,;:\\"\/\[\]?=]+/.freeze
    CONDISP = /Content-Disposition:\s*#{TOKEN}\s*/i.freeze
    VALUE = /"(?:\\"|[^"])*"|#{TOKEN}/.freeze
    BROKEN_QUOTED = /^#{CONDISP}.*;\s*filename="(.*?)"(?:\s*$|\s*;\s*#{TOKEN}=)/i.freeze
    BROKEN_UNQUOTED = /^#{CONDISP}.*;\s*filename=(#{TOKEN})/i.freeze
    MULTIPART_CONTENT_TYPE = /Content-Type: (.*)#{EOL}/ni.freeze
    MULTIPART_CONTENT_DISPOSITION = /Content-Disposition:.*;\s*name=(#{VALUE})/ni.freeze
    MULTIPART_CONTENT_ID = /Content-ID:\s*([^#{EOL}]*)/ni.freeze
    # Updated definitions from RFC 2231
    ATTRIBUTE_CHAR = %r{[^ \t\v\n\r)(><@,;:\\"/\[\]?='*%]}.freeze
    ATTRIBUTE = /#{ATTRIBUTE_CHAR}+/.freeze
    SECTION = /\*[0-9]+/.freeze
    REGULAR_PARAMETER_NAME = /#{ATTRIBUTE}#{SECTION}?/.freeze
    REGULAR_PARAMETER = /(#{REGULAR_PARAMETER_NAME})=(#{VALUE})/.freeze
    EXTENDED_OTHER_NAME = /#{ATTRIBUTE}\*[1-9][0-9]*\*/.freeze
    EXTENDED_OTHER_VALUE = /%[0-9a-fA-F]{2}|#{ATTRIBUTE_CHAR}/.freeze
    EXTENDED_OTHER_PARAMETER = /(#{EXTENDED_OTHER_NAME})=(#{EXTENDED_OTHER_VALUE}*)/.freeze
    EXTENDED_INITIAL_NAME = /#{ATTRIBUTE}(?:\*0)?\*/.freeze
    EXTENDED_INITIAL_VALUE = /[a-zA-Z0-9\-]*'[a-zA-Z0-9\-]*'#{EXTENDED_OTHER_VALUE}*/.freeze
    EXTENDED_INITIAL_PARAMETER = /(#{EXTENDED_INITIAL_NAME})=(#{EXTENDED_INITIAL_VALUE})/.freeze
    EXTENDED_PARAMETER = /#{EXTENDED_INITIAL_PARAMETER}|#{EXTENDED_OTHER_PARAMETER}/.freeze
    DISPPARM = /;\s*(?:#{REGULAR_PARAMETER}|#{EXTENDED_PARAMETER})\s*/.freeze
    RFC2183 = /^#{CONDISP}(#{DISPPARM})+$/i.freeze

    class << self
      def parse_multipart(env, params = Rack::Utils.default_query_parser)
        extract_multipart Rack::Request.new(env), params
      end

      def extract_multipart(req, params = Rack::Utils.default_query_parser)
        io = req.get_header(RACK_INPUT)
        io.rewind
        content_length = req.content_length
        content_length = content_length.to_i if content_length

        tempfile = req.get_header(RACK_MULTIPART_TEMPFILE_FACTORY) || Parser::TEMPFILE_FACTORY
        bufsize = req.get_header(RACK_MULTIPART_BUFFER_SIZE) || Parser::BUFSIZE

        info = Parser.parse io, content_length, req.get_header('CONTENT_TYPE'), tempfile, bufsize, params
        req.set_header(RACK_TEMPFILES, info.tmp_files)
        info.params
      end

      def build_multipart(params, first = true)
        Generator.new(params, first).dump
      end
    end
  end
end
