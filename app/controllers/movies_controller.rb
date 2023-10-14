class MoviesController < ApplicationController
  def new
  end

  def index 
      @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(title: params[:movie][:title], year: params[:movie][:year], plot: params[:movie][:plot], country: params[:movie][:country], running_time: params[:movie][:running_time], genre_id: params[:movie][:genre], director_id: params[:movie][:director])
    @movie.save
    redirect_to root_path
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(params.require(:movie).permit(:title, :year, :plor, :country, :running_time, :genre_id))
    redirect_to root_path
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to root_path
  end

end