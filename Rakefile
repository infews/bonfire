require 'tilt'

desc "Build Github page"
task :pages do

  css_files = ["pages.css", 'http://fonts.googleapis.com/css?family=Arvo:regular,italic,bold,bolditalic']
  scope    = OpenStruct.new(:title     => "Bonfire",
                            :css_files => css_files,
                            :body      => Tilt.new('pages/source/index.md').render)
  index = Tilt.new("templates/draft/draft.haml")

  f = File.open('index.html', 'w+')
  f << index.render(scope)
  f.close
end