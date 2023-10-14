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
      @genre.save #salva no banco a tarefa que criamos
      redirect_to root_path
    end

    def edit
      # Novamente utilizamos o params, dando uma olhada no routes
     # vemos o nome do parâmetro na rota de edit.
     @genre = Genre.find(params[:id])
   end

   def update
    @genre = Genre.find(params[:id])
    @genre.update(params.require(:genre).permit(:description, :status))
    redirect_to root_path
   end
   def destroy
    genre = Genre.find(params[:id]) # não precisamos de @ pois não temos view que usará esse objeto
    genre.destroy #destrói a tarefa encontrada
    redirect_to root_path
    end

  end