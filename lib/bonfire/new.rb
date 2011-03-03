class Bonfire < Thor

  attr_reader :book_name

  desc "new BOOK_NAME", "Make a project directory for BOOK_NAME"
  def new(name = "bonfire_book")
    @book_name = name
    directory "templates/new", name
  end

end