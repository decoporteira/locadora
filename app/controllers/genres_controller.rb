class GenresController < ApplicationController
  def new
  end
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = Movie.where(genre_id: params[:id])
  end

  def create
    @genre = Genre.new(name: params[:genre][:name])
    @genre.save
    redirect_to root_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(params.require(:genre).permit(:description, :status))
    redirect_to root_path
  end
  def destroy
    genre = Genre.find(params[:id]) 
    genre.destroy 
    redirect_to root_path
  end

  end