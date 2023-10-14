class DirectorsController < ApplicationController
    def new
    end
    def index
      @directors =[]
      @directors = Director.all
    end
    def show
      @director = Director.find(params[:id])
      @movies = Movie.where(director_id: params[:id])
    end

    def create
      @director = Director.new(name: params[:director][:name], nationality: params[:director][:nationality], date: params[:director][:date], genre_id: params[:director][:genre])
      @director.save #salva no banco a tarefa que criamos
      p params[:director][:name]
      redirect_to root_path
    end

    def edit
      # Novamente utilizamos o params, dando uma olhada no routes
     # vemos o nome do parâmetro na rota de edit.
     @director = Director.find(params[:id])
   end

   def update
    @director = Director.find(params[:id])
    @director.update(params.require(:director).permit(:name, :nationality, :date, :genre_id))
    redirect_to root_path
   end
   def destroy
    director = Director.find(params[:id]) # não precisamos de @ pois não temos view que usará esse objeto
    director.destroy #destrói a tarefa encontrada
    redirect_to root_path
    end

  end