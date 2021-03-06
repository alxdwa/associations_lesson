class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @books = Book.all
    @authors = Author.all
  end

  def create
    @author = params[:author]
    @title = params[:title]
    @description = params[:description]
    @current_user = current_user.id

    @new_book = Author.find_by(name: @author).books.create(title: @title, description: @description, user_id: @current_user)
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

  def edit
    @authors = Author.all
    @books = Book.all
    @book = Book.find(params[:id])
    @author_id = Book.find(params[:id]).author_id
    @author_name = Author.find(@author_id).name
    @genres = Genre.all
    @selected_genres = @book.genres.pluck(:name)
  end

  def update
    @book = Book.find(params[:id])
    @book.title = params[:title]
    @book.description = params[:description]
    @book.genres = []
    @genre_ids = params[:genres]
    @genre_ids.each { |genre_id| @book.genres << Genre.find(genre_id) }
    @book.save
    redirect_to book_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end
end