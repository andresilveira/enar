Enar::Application.routes.draw do
  devise_for :users
  
  get "fichas/search" => "fichas#search", as: :search_fichas
  
  resources :fichas

  root to: "fichas#index"
end
