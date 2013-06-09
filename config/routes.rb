Gowatchit::Application.routes.draw do

  resources :movies, only: [:index, :show]

  root :to => 'movies#index'

end
