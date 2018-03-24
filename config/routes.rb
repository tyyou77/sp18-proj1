Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers
  patch '/', to: 'pokemons#capture', as: 'capture'
  patch 'trainers/:id/:pokemon_id', to: 'pokemons#damage', as: 'damage'
end
