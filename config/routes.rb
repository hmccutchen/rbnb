Rails.application.routes.draw do
  get 'reservations/index'

  get 'reservations/new'

  get 'reservations/create'

  get 'reservations/destoy'

  devise_for :users
  root to: 'dogs#index'

  resources :dogs do
    resources :reservations
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
