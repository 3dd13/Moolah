MoolahMeerkat::Application.routes.draw do

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get]
  match 'auth/failure', to: redirect('/'), via: [:get]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get]
  
  root 'welcome#index'
  

  resources :users, except: [:index] do
    resources :activities, only: [:index]
    collection do
      get 'search'
    end

    resources :achievements, only: [:index, :show] do
    end

    resources :goals do
      resources :transactions do
      end
    end

    resources :connections, only: [:create, :index, :destroy] do
    end

  end
end


