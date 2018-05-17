Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "top_pages#index"

  get "/reset" => "top_pages#delete_image"
  get "/result" => "top_pages#show"

  post '/upload' => "top_pages#create"
end
