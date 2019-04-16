class BooksController < ApplicationController
  def index
    @books = Book.all
    @authors = Author.all
  end

  def create
    @author = params[:author]
    @title = params[:title]
    @description = params[:description]

    @new_book = Author.find_by(name: @author).books.create(title: @title, description: @description)
    @genre_ids = params[:genres]
    @genre_ids.each { |genre_id| @new_book.genres << Genre.find(genre_id) }

    redirect_to books_path
  end

  def new
    @authors = Author.all
    @author_names = Author.all.collect(&:name)
    @genres = Genre.all
  end

  def show
    @book = Book.find(params[:id])
    @author = @book.author.name
  end
end