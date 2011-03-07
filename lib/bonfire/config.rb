module Bonfire
  class Config

    def self.load
      self.new(YAML.load(File.open('bonfire.yml')))
    end

    def initialize(yaml = {})
      @yaml = yaml
    end

    def book_name
      @yaml["book_name"] || 'bonfire'
    end

    def sections
      filenames = @yaml['sections'] || Dir.chdir(File.join(Dir.pwd, 'source', 'sections')) { Dir.glob('*') } || []
      filenames.collect {|f| f.match(/\.md$/) ? f : "#{f}.md" }
    end

  end
end