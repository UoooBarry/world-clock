Rails.application.routes.draw do
  root :to => "home#index"
  get 'home/index'
  get '/check', to: 'home#check'
  get '/del_city', to: 'home#del_city'
  get '/add_city', to: 'home#add_city'
  get '/utcs', to: "utc_tag#index", as: 'utcs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
