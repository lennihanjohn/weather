Rails.application.routes.draw do
  resources :homes 
  post 'homes/search_city', to: 'homes#search_city', as: :search_city;

  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
