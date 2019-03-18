Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do

  # Public-facing routes

  	get "/quilts" => "quilts#index"
  	get "/quilts/:id" => "quilts#show"
  	
  # Admin routes

    post "/admins" => "admins#create"

    post "/sessions" => "sessions#create"

    post "/quilts" => "quilts#create"
    patch "/quilts/:id" => "quilts#update"
    delete "/quilts/:id" => "quilts#destroy"

  end
end
