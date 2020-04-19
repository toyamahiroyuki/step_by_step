require 'rubygems'
require 'spec'

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib"), File.join(File.dirname(__FILE__), "..", "build", RUBY_VERSION) unless RUBY_PLATFORM =~ /java/
require "ffi"
