Rails.application.routes.draw do
  resources :promo_items
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  # resources :line_items
  resources :carts
  resources :menu_items
  resources :employees
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/contact", to: "main#contact"
  get "/home", to: "main#index"
  get "/menu", to: "main#menu"
  get "/promoitem", to: "main#promo_item"
  get "/login", to: "main#login"
  get "/orders", to: "main#orders"

  get "/employees", to: "employees#index"
  get "/menuitems", to: "menu_items#index"
  get "/promoitems", to: "promo_items#index"
  get "/newemployees", to: "employees#new"


  # get 'carts/:id' => "carts#show", as: "/carts"
  delete 'carts/:id' => "carts#destroy"

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  root "main#index"



end
