Rails.application.routes.draw do
  
  get 'charges/create'

  get 'charges/new'

  resources :charges

  post   'add_to_cart' => 'cart#add_to_cart'
 
  get   'view_cart' => 'cart#view_order'

  get   'checkout' => 'cart#checkout'

  get 'admin' => 'products#index'



  devise_for :users

   root 'storefront#all_items'

  get 'categorical' => 'storefront#items_by_category' 

  get 'branding' => 'storefront#items_by_brand'
  
  post 'order_complete' => 'cart#order_complete'

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
