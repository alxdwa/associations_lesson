class BooksController < ApplicationController
  def index
    @books = Book.all
    @authors = Author.all
  end

  def create
    @author = params[:author]
    @title = params[:title]
    Author.find_by(name: @author).books.create(title: @title)
    redirect_to books_path
  end

  def new
    @authors = Author.all
    @author_names = Author.all.collect(&:name)
  end

  def show

  end
end