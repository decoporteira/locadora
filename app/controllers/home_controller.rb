class HomeController < ApplicationController
    def welcome
        @genres = Genre.all
        @directors = Director.all
        @movies = Movie.all
    end
  
    
end
