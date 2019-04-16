class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def create
    @name = params[:name]
    @date_of_birth = params[:date_of_birth]
    Author.create(name: @name, date_of_birth: @date_of_birth)
    redirect_to authors_path
  end

  def new

  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end
end