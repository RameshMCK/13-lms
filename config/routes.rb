Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "home#index"
  # resources :users
  
  # resources :courses
  # resources :registrations
  
    require "sidekiq/web"
  mount Sidekiq::Web => '/sidekiq'

  root to: 'home#index'
  get '/users', to: 'users#index'
  get '/users/edit_role', to: 'users#edit_role'
  put '/users/update_role', to: 'users#update_role'
  get '/users/logs', to: 'users#logs'
  
  # resources :courses, only: [:index, :new, :create] do
  #   resources :syllabuses
  # end
  
  
   resources :courses, only: [:index, :new, :create] do
    member do
      get '/sections', to: 'courses#section_list'
      post '/sections', to: 'courses#section_create'
      put '/sections/:section_id/up', to: 'courses#up', as: 'goup'
      put '/sections/:section_id/down', to: 'courses#down', as: 'godown'
    end
  end
  
  
  resources :registrations, only: [:index, :new, :create] do
    member do
      put '/toggle_open', to: 'registrations#toggle_open'
    end
  end

end
