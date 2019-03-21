Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do

  # Public-facing routes

  	get "/quilts" => "quilts#index"

    # This route is not public-facing but is here to be restful!
    post "/quilts" => "quilts#create"

  	get "/quilts/:id" => "quilts#show"
  	
  # Admin routes

    post "/admins" => "admins#create"

    post "/sessions" => "sessions#create"

    patch "/quilts/:id" => "quilts#update"
    delete "/quilts/:id" => "quilts#destroy"

  end
end
