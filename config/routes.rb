Rails.application.routes.draw do
  get "/all_products", controller: "products", action: "all_products"

  get "/shirts", controller: "products", action: "shirts"

  get "/pants", controller: "products", action: "pants"

  get "/hats", controller: "products", action: "hats"
end
