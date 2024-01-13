# config/routes.rb
Rails.application.routes.draw do
  root 'search#index'
  post '/search', to: 'search#create'
end
