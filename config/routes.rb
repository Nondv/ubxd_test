Rails.application.routes.draw do
  root to: 'favourite_language_guess#index'
  get '/guess', to: 'favourite_language_guess#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
