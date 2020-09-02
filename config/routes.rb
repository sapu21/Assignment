Rails.application.routes.draw do

  root to: "querylists#index"
  resources :querylists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
