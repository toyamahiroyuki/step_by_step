require 'rubygems'
require 'rspec'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

['dm-core', 'dm-active_model', 'mongoid', 'active_record', 'mongo_mapper'].each do |orm|
  require orm
rescue LoadError
  puts "#{orm} not available"
end

require 'orm_adapter'
