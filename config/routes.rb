OuiShare::Application.routes.draw do
  resources :authorizations, only: [:destroy]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root :to => "home#index"

  filter :locale, exclude: /\/auth\//

  namespace :admin do
    resources :languages do
      resources :top_banners
      resources :what_is_sections
    end
    get '/' => 'home#index'
    get 'home' => 'home#home'
  end

  get 'newsletter'     => 'newsletter#index', as: 'newsletter'
  post 'newsletter/subscribe' => 'newsletter#subscribe', as: 'newsletter_subscribe'

  get 'about' => 'about#index', as: 'about'
  get 'team'  => 'team#index',  as: 'team'
  get 'communities' => 'communities#index', as: 'communities'
  get 'contact' => 'contact#index', as: 'contact'
  get 'projects' => 'projects#index', as: 'projects'
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
