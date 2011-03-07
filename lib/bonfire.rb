require 'thor'
require 'tilt'

module Bonfire
  class CLI < Thor
    include Thor::Actions

    @@source_root = File.join(File.dirname(__FILE__), '..')

    def self.source_root
      @@source_root
    end

    def self.template_dir
      @@template_dir = File.join(Bonfire::CLI.source_root, 'templates')
    end

  end
end

Dir["#{File.dirname(__FILE__)}/bonfire/**/*.rb"].each do |file|
  require file
end

