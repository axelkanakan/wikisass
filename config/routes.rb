Wikisass::Application.routes.draw do
  
  resources :wikis

  match "about" => 'welcome#about', via: :get

  devise_for :users
  
  root :to => 'welcome#index'  

end
