require 'rubygems'
require 'tilt'
require 'yaml'

class Bonfire < Thor

  desc "draft", "Makes a single HTML file of sections in the correct order"

  def draft
    # load YAML

    bonfire_yaml = YAML.load(File.open(File.join(Dir.pwd, 'bonfire.yml'))) || {}

    book_name = bonfire_yaml["book_name"]

    FileUtils.mkdir_p('output/draft')
    Dir.chdir('output/draft') do
      `touch #{book_name}_draft.html`
    end


#    template = Tilt::Template.new('templates/draft.haml')
#
#    FileUtils.mkdir_p('output/draft')
#    Dir.chdir('output/draft') do
#      draft = File.new("#{book_name}_draft.html", 'w+')
#
#      draft << template.render(sections.join("\n\n<hr/>\n\n"))
#    end


  end

end