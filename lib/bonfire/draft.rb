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
        bonfire = Config.load

        directory File.join(Dir.pwd, 'source/css'), 'output/draft/css'
        directory File.join(Dir.pwd, 'source/images'), 'output/draft/images'

        css_files = Dir.chdir(File.join(Dir.pwd, 'source')) { Dir.glob('css/**/*.css') }
        sections  = bonfire.sections.collect {|s| Tilt.new("source/sections/#{s}").render }

        scope     = OpenStruct.new(:title     => bonfire.book_name,
                                   :css_files => css_files,
                                   :body      => sections.join("\n\n<hr/>\n\n"))
        template  = load_template("draft/draft.haml")

        FileUtils.mkdir_p('output/draft')
        create_file "output/draft/#{bonfire.book_name}_draft.html" do
          template.render(scope)
        end
      end
    end

    no_tasks do
      def load_template(filename)
        template_path = File.join(Bonfire::CLI.template_dir, filename)
        Tilt.new(template_path)
      end
    end

  end
end