$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'thor'
require 'bonfire'

require 'rubygems'
require 'thor'

require 'rspec'
require 'pp'
require 'nokogiri'
require 'tmpdir'

RSpec.configure do |config|
end

def capture_output
   output = StringIO.new
   $stdout = output
   yield
   output.string
 ensure
   $stdout = STDOUT
end
