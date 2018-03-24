class PokemonsController < ApplicationController

  def new
    @pokemon = Pokemon.new
	end

  def capture
    pokemon = Pokemon.find(params[:id])
    pokemon.trainer = current_trainer
    pokemon.save
    redirect_to :root
  end

  def damage
    pokemon = Pokemon.find(params[:id])
    pokemon.health = pokemon.health - 10
    if pokemon.health <= 0
      pokemon.destroy
    else
      pokemon.save
    end
    redirect_to pokemon.trainer
  end

  def create
		pokemon = Pokemon.new(params.require(:pokemon).permit(:name))
		pokemon.update(level: 1, health: 100, trainer_id: current_trainer.id)

		if pokemon.save
			redirect_to current_trainer
		else
			redirect_to new_pokemon_path
			flash[:error] = @pokemon.errors.full_messages.to_sentence
		end
	end

end
