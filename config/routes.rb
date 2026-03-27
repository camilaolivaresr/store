Rails.application.routes.draw do
  get "products/index"

  get "/products", to: "products#index"

  get "/products/:id", to: "products#show"


  post "/products", to: "products#create"

  
end
