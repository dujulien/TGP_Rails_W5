Rails.application.routes.draw do

  resources :gossips do
  		resources :comments
  end
  resources :user
  resources :team, only:[:index]
  resources :contacts, only:[:index]
  resources :city, only:[:show]
  resources :session, only:[:new, :create, :destroy]
  resources :like, only:[:create, :destroy]
  # get 'welcome/', to: 'gossip#home'
  # get 'welcome/:user_name', to: 'gossip#homesecret', as: 'welcome_secret'
  # get 'gossip/:id', to:'gossip#index', as: 'gossip'
  # get 'create_gossip', to: 'gossip#create_gossip'
  # get 'contacts', to: 'gossip#contacts'
  # get 'team', to: 'gossip#team'
  # get 'user/:id', to:'gossip#user', as: 'user'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.or/routing.html
end
