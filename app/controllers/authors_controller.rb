class AuthorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.name = params[:name]
    @author.date_of_birth = params[:date_of_birth]
    @author.save
    redirect_to author_path
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end
end