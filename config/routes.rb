SevenHills::Application.routes.draw do
  root 'pages#home'

  get '/home', to: 'pages#home'
  get '/tandem', to: 'pages#tandem'
  get '/iad', to: 'pages#iad'
  get '/experienced', to: 'pages#experienced'
  get '/pricing', to: 'pages#pricing'
  get '/faq', to: 'pages#faq'
  get '/testimonials', to: 'pages#testimonials'
  get '/facilities', to: 'pages#facilities'
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/members', to: 'users#index'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/continuing', to: 'pages#continuing'
  get '/set_member', to: 'users#set_member'
  post '/set_member', to: 'users#member_authentication'
  patch '/set_member', to: 'users#member_authentication'

  resources :posts, only: [:new, :create, :edit, :update]
  resources :users, only: [:create, :edit, :show]
  resources :shifts
  resources :reservations, only: [:new, :create, :show, :index] do
    collection do
      get '/search', to: 'reservations#find'
      post '/search', to: 'reservations#search'
    end
  end

  get '/reservations_home', to: 'reservations#home'
  resources :students, only: [:new, :create]
  resources :openings, only: [:index, :show] do
    collection do
      get '/reserve', to: 'openings#find_reservation'
      post '/reserve', to: 'openings#save_reservation'
      post '/search', to: 'openings#search'
      get '/find_roster', to: 'openings#find_roster'
      post '/roster', to: 'openings#roster'
    end
  end
  namespace :admin do
    resources :openings, only: [:new, :create, :edit, :update, :destroy] do
      collection do
        post '/copy', to: 'openings#copy'
      end
    end
    post 'confirm/:id', to: "students#confirm"
  end
  
end
