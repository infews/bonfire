require 'thor'
require 'rubygems'
require 'tilt'
require 'rdiscount'
require 'yaml'

module Bonfire
  class CLI < Thor

    desc "draft", "Makes a single HTML file of sections in the correct order"

    def draft
      Dir.chdir(Dir.pwd) do
        bonfire = YAML.load(File.open('bonfire.yml')) || {}

        directory File.join(Dir.pwd, 'source/css'), 'output/draft/css'
        directory File.join(Dir.pwd, 'source/images'), 'output/draft/images'

        book_name           = bonfire['book_name']

        bonfire['sections'] = bonfire['sections'] || Dir.chdir(File.join(Dir.pwd, 'source',
                                                                         'sections')) { Dir.glob('*') }.compact

        sections            = bonfire['sections'].collect do |section|
          section = "#{section}.md" unless section.match(/\.md$/)
          Tilt.new("source/sections/#{section}").render
        end
        css_files           = Dir.chdir(File.join(Dir.pwd, 'source')) { Dir.glob('css/**/*.css') }

        scope               = Scope.build(:title     => book_name,
                                          :css_files => css_files,
                                          :body      => sections.join("\n\n<hr/>\n\n"))
        template            = load_template("draft/draft.haml")

        FileUtils.mkdir_p('output/draft')
        create_file "output/draft/#{book_name}_draft.html" do
          template.render(scope)
        end
      end
    end

    no_tasks do
      def load_template(filename)
        template_path = File.join(Bonfire::CLI.source_root, 'templates', filename)
        Tilt.new(template_path)
      end
    end

  end
end