class BooksController < ApplicationController
  def index
    @books = Book.all
    @authors = Author.all
  end

  def create
    @author = params[:author]
    @author_name = params[:name]
    @title = params[:title]
    Author.find_by(name: @author).books.create(title: @title)
    Author.create(name: @author_name)
    redirect_to books_path
  end

  def new
    @authors = Author.all
    @author_names = Author.all.collect(&:name)
  end

  def show
    @book = Book.find(params[:id])
    @author = @book.author.name
  end
end