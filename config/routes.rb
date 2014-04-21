Wikisass::Application.routes.draw do

   



  resources :subscriptions, only: [:new, :create]

  

  resources :wikis

  match "about" => 'welcome#about', via: :get

  devise_for :users
  
  authenticated :user do
  	root to: 'wikis#index'
  end

  resources :users, only: [:show]
  
  
  root :to => 'welcome#index'  

end
