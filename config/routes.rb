Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root "static_pages#top"
  resources :users, only: %i[new create]
  resources :boards, only: %i[index new create show edit update destroy] do
    resources :comments, only: %i[create edit destroy], shallow: true
    collection do
      get :bookmarks
    end  
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  namespace :admin do
    root "dashboards#index"
    resource :dashboard, only: %i[index]
    get 'login' => 'user_sessions#new', :as => :login
    post 'login' => "user_sessions#create"
    delete 'logout' => 'user_sessions#destroy', :as => :logout
    resources :boards, only: %i[index edit update show destroy]
    resources :users, only: %i[index edit update show destroy]
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
