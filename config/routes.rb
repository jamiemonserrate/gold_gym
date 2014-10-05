GoldGym::Application.routes.draw do
  resources :members

  resources :workouts

  resources :clubs

  resources :club_owners

  root 'home#index'
end
