class Bonfire < Thor
  desc "new BOOK_NAME", "Make a project directory for BOOK_NAME"

  def new(name)
    directory "templates/new", name
  end

end