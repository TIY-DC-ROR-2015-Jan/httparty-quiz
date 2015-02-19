Rails.application.routes.draw do
  post '/add' => 'posts#create'

  root to: 'posts#index'
end
