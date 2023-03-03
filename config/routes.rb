Rails.application.routes.draw do
  #get "/all_products", controller: "products", action: "all_products"
  get "/products" => "products#index"

  # get "/one_product/:id", controller: "products", action: "one_product"
  get "/products/:id" => "products#show"

  post "/products" => "products#create"

  patch "/products/:id" => "products#update"
end
