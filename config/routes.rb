Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'  
  get "/products", to: 'products#index'
  get "/products/new", to: 'products#new'
  post "/products", to: 'products#create'
  get "/products/search", to: 'products#search'
  get "/products/:id", to: 'products#show'
  get "/products/:id/edit", to: 'products#edit'
  patch "/products/:id", to: 'products#update'
  delete "/products/:id", to: 'products#destroy'


  get "/suppliers", to: 'suppliers#index'
  get "/suppliers/new", to: 'suppliers#new'
  post "/suppliers", to: 'suppliers#create'
  get "/suppliers/:id", to: 'suppliers#show'
  get "/suppliers/:id/edit", to: 'suppliers#edit'
  patch "/suppliers/:id", to: 'suppliers#update'
  delete "/products/:id", to: 'suppliers#destory'
end
