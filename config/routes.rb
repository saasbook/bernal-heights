Rails.application.routes.draw do
  resources :resources
  devise_for :admins, path: "admin", singular: :admin, module: "admin"
  resources :admins, path: "staff", except: [:index, :update, :edit]
  get '/staff' => 'admins#index', as: :staff_accounts
  
  devise_scope :admin do
    get '/sign_out' => 'admin/sessions#destroy', as: :sign_out
    get 'admin/' => 'admin/sessions#home', as: :admin_home
    get 'admin/events/unapproved' => 'admin/events#unapproved', as: :admin_unapproved_events
  end
  
  resources :events do
    get '/events/:day', to: 'events#index'
  end
  
  resources :hotspots do
    member do
        get 'gps'
    end
  end
  
  namespace :admin do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    resources :events do
      post 'confirm'
      # get 'day_events'
    end
    resources :hotspots
  end

  #mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root :to => redirect('/events')
   # currently putting admin home page route under app controller // FIX
  # get 'admin/dashboard' => 'application#admin_dashboard', as: :admin_dashboard

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
