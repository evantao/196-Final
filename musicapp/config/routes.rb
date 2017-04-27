Rails.application.routes.draw do

  resources :albums_tests
  resources :tests
  resources :albums
  resources :users

  get 'login' => 'sessions#login', :as => 'log_in' 
  get 'logout' => 'sessions#destroy', :as => 'log_out'
  post 'login' => 'sessions#create', :as => 'create_login'

  get 'tests/:id/play' => 'tests#play', :as => 'test_play' 
  post 'tests/:id/play' => 'tests#submit', :as => 'test_submit'
  get 'tests/:id/album' => 'tests#add_album', :as => 'test_add_album'
  post 'tests/:id/album' => 'tests#create_album', :as => 'test_create_album'
  delete 'tests/:id/album/:album_id' => 'tests#delete_album', :as => 'test_delete_album'

  root 'welcome#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
