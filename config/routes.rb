Rails.application.routes.draw do
  get '/books' => 'books#new'
  get '/index' => 'books#index'
  get '/show' => 'books#show'
  get '/edit' => 'books#edit'
  get '/' => 'homes#top'
  post 'books' => 'books#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
