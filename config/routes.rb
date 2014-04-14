Wikisass::Application.routes.draw do

   

  resources :subscriptions, only: [:new, :create]

  resources :wikis

  match "about" => 'welcome#about', via: :get

  devise_for :users
  
  
  root :to => 'welcome#index'  

end
