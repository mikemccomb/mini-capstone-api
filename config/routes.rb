Rails.application.routes.draw do
  #get "/all_products", controller: "products", action: "all_products"
  get "/products" => "products#index"

  # get "/one_product/:id", controller: "products", action: "one_product"
  get "/products/:id" => "products#show"

  post "/products" => "products#create"

  patch "/products/:id" => "products#update"

  delete "/products/:id" => "products#destroy"

  get "/suppliers" => "suppliers#index"

  # get "/one_product/:id", controller: "suppliers", action: "one_product"
  get "/suppliers/:id" => "suppliers#show"

  post "/suppliers" => "suppliers#create"

  patch "/suppliers/:id" => "suppliers#update"

  delete "/suppliers/:id" => "suppliers#destroy"
end
