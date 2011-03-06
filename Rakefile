require 'bundler'
Bundler::GemHelper.install_tasks

require 'tilt'


desc "Run all specs"
task :spec do
  system("rspec spec")
end

task :default => :spec


desc "Build Github page"
task :gh_pages do

  css_files = ["pages.css", 'http://fonts.googleapis.com/css?family=Arvo:regular,italic,bold,bolditalic']
  scope    = OpenStruct.new(:title     => "Bonfire",
                            :css_files => css_files,
                            :body      => Tilt.new('pages/source/index.md').render)
  index = Tilt.new("templates/draft/draft.haml")

  f = File.open('pages/index.html', 'w+')
  f << index.render(scope)
  f.close

end