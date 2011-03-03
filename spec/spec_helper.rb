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

def capture_output
  output  = StringIO.new
  $stdout = output
  yield
  output.string
ensure
  $stdout = STDOUT
end

def make_tmp_dir
  tmp_dir = "#{Dir.tmpdir}/bonfire-spec-dir"
  remove_dir tmp_dir
  FileUtils.mkdir_p tmp_dir
  tmp_dir
end

def remove_dir(dir)
  FileUtils.rm_r dir if File.exists?(dir)
end