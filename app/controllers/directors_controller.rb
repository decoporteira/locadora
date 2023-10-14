class DirectorsController < ApplicationController
  def new
  end
  def index
    @directors = Director.all
  end
  def show
    @director = Director.find(params[:id])
    @movies = Movie.where(director_id: params[:id])
  end

  def create
    @director = Director.new(name: params[:director][:name], nationality: params[:director][:nationality], date: params[:director][:date], genre_id: params[:director][:genre])
    @director.save 
    redirect_to root_path
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])
    @director.update(params.require(:director).permit(:name, :nationality, :date, :genre_id))
    redirect_to root_path
  end

  def destroy
    director = Director.find(params[:id])
    director.destroy 
    redirect_to root_path
  end

end