# frozen_string_literal: true

require 'lsapi'

module Rack
  module Handler
    class LSWS
      def self.run(app, **options)
        while !LSAPI.accept.nil?
          serve app
        end
      end

      def self.serve(app)
        env = ENV.to_hash
        env.delete "HTTP_CONTENT_LENGTH"
        env[SCRIPT_NAME] = "" if env[SCRIPT_NAME] == "/"

        rack_input = RewindableInput.new($stdin.read.to_s)

        env.update(
          RACK_VERSION => Rack::VERSION,
          RACK_INPUT => rack_input,
          RACK_ERRORS => $stderr,
          RACK_MULTITHREAD => false,
          RACK_MULTIPROCESS => true,
          RACK_RUNONCE => false,
          RACK_URL_SCHEME => ["yes", "on", "1"].include?(ENV[HTTPS]) ? "https" : "http"
        )

        env[QUERY_STRING] ||= ""
        env[HTTP_VERSION] ||= env[SERVER_PROTOCOL]
        env[REQUEST_PATH] ||= "/"
        status, headers, body = app.call(env)
        begin
          send_headers status, headers
          send_body body
        ensure
          body.close if body.respond_to? :close
        end
      ensure
        rack_input.close
      end

      def self.send_headers(status, headers)
        print "Status: #{status}\r\n"
        headers.each do |k, vs|
          vs.split("\n").each do |v|
            print "#{k}: #{v}\r\n"
          end
        end
        print "\r\n"
        STDOUT.flush
      end

      def self.send_body(body)
        body.each do |part|
          print part
          STDOUT.flush
        end
      end
    end
  end
end
