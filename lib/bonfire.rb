require 'thor'


class Bonfire < Thor
  include Thor::Actions

  VERSION = "0.0.1"

  @@source_root = File.join(File.dirname(__FILE__), '..')
  def self.source_root
    @@source_root
  end

  def self.template_dir
    @@template_dir
  end

end

Dir["#{File.dirname(__FILE__)}/bonfire/**/*.rb"].each do |file|
  require file
end
