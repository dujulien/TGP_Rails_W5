Rails.application.routes.draw do

  get 'welcome/:user_name', to: 'gossip#homesecret', as: 'welcome_secret'
  get 'welcome/', to: 'gossip#home'
  get 'contacts', to: 'gossip#contacts'
  get 'team', to: 'gossip#team'
  get 'gossip/:id', to:'gossip#index', as: 'gossip'
  get 'user/:id', to:'gossip#user', as: 'user'
  get 'create_gossip', to: 'gossip#create_gossip'
  # For details on the DSL available within this file, see http://guides.rubyonrails.or/routing.html
end
