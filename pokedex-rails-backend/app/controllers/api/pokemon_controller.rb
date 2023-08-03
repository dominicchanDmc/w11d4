class Api::PokemonController < ApplicationController
    def index 
        @pokemons = Pokemon.all
        render :index
    end
   
    def show 
        @pokemon = Pokemon.find(params[:id])
        render :show
    end

    def create
        @pokemon = Pokemon.new (pokemon_params)
        if @pokemon.save
            render json: @pokemon
        else
            render json: @pokemon.errors
        end
    end

    def update
        @pokemon = Pokemon.find(params[:id])
        if @pokemon && @pokemon.update(pokemon_params)
            render json: @pokemon
        elsif !@pokemon
            render json: "pokemon not found! ",status:404
        else
            render json: @pokemon.errors
        end
    end


    private
    def pokemon_params
      params.require(:pokemon).permit(
        :number,
        :name,
        :attack,
        :defense,
        :poke_type,
        :image_url,
        :captured)
    end
end
