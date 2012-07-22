Lbdevelopmentv03::Application.routes.draw do

  get "fliers/show"

  get "fliers/new"

  get "fliers/update"

  get "fliers/destroy"

  post "fliers/create"
  
  resources :users
  resources :fliers
  

  get "liveboard/index"

  get "users/create"

  get "users/update"

  get "users/show"

  get "users/destroy"

  get "pages/welcome"

  get "pages/contact"

  get "pages/faq"

  get "pages/press"


  match 'login', to: 'auth/facebook'
  match 'logout', to: 'sessions#destroy'
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: 'pages#welcome'
  match 'liveboard', to: 'liveboard#index', as: 'liveboard'
  match 'community_select', to: 'users#community_select'
  match 'create_flier', to: 'fliers#new'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#welcome'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
