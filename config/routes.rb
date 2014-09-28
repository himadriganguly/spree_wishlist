Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  resources :wishlists, :only => [:index, :create, :destroy]
end
