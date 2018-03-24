class PokemonsController < ApplicationController

  def capture
    pokemon = Pokemon.find(params[:id])
    pokemon.trainer = current_trainer
    pokemon.save
    redirect_to :root
  end

  def damage
    pokemon = Pokemon.find(params[:id])
    pokemon.health = pokemon.health - 10
    redirect_to :back
  end

end
