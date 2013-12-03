OuiShare::Application.routes.draw do
  resources :authorizations, only: [:destroy]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root :to => "home#index"

  filter :locale, exclude: /\/auth\//

  namespace :admin do
    resources :languages do
      resources :top_banners
      resources :what_is_sections
      resources :hot_projects_sections
      resources :events_sections
      resources :take_part_sections
      resources :partners
      resources :about
      resources :projects
    end
    get '/' => 'home#index'
    get 'home' => 'home#home'
    get 'about' => 'home#about'
  end

  resources :donations

  get 'newsletter'     => 'newsletter#index', as: 'newsletter'
  post 'newsletter/subscribe' => 'newsletter#subscribe', as: 'newsletter_subscribe'

  get 'about' => 'about#index', as: 'about'
  get 'team'  => 'team#index',  as: 'team'
  get 'communities' => 'communities#index', as: 'communities'
  get 'contact' => 'contact#index', as: 'contact'
  get 'projects' => 'projects#index', as: 'projects'
  get 'events' => 'events#index', as: 'events'

  get 'about/mission' => 'about#mission', as: 'about_mission'
  get 'about/vision' => 'about#vision', as: 'about_vision'
  get 'about/history' => 'about#history', as: 'about_history'
  get 'about/organization' => 'about#organization', as: 'about_organization'
  get 'about/team' => 'about#team', as: 'about_team'
  get 'about/advisory' => 'about#advisory', as: 'about_advisory'

  get 'communities/local' => 'communities#local', as: 'communities_mission'
  get 'communities/communities' => 'communities#communities', as: 'communities_communities'
  get 'communities/ouishare' => 'communities#ouishare', as: 'communities_ouishare'
  get 'communities/live' => 'communities#live', as: 'communities_live'
  get 'communities/people' => 'communities#people', as: 'communities_people'

  get 'knowledge' => 'knowledge#index', as: 'knowledge'
  get 'knowledge/research' => 'knowledge#research', as: 'knowledge_research'
  get 'knowledge/expert' => 'knowledge#expert', as: 'knowledge_expert'
  get 'knowledge/groups' => 'knowledge#groups', as: 'knowledge_groups'
  get 'knowledge/ouiki' => 'knowledge#ouiki', as: 'knowledge_ouiki'

  get 'getinvolved' => 'getinvolved#index', as: 'getinvolved'
  get 'press' => 'press#index', as: 'press'
  get 'workus' => 'workus#index', as: 'workus'
  get 'getinvolved' => 'getinvolved#index', as: 'getinvolved'
  get 'press' => 'press#index', as: 'press'
  get 'workus' => 'workus#index', as: 'workus'

  get 'about/mission' => 'about#mission', as: 'about_mission'
  get 'about/vision' => 'about#vision', as: 'about_vision'
  get 'about/history' => 'about#history', as: 'about_history'
  get 'about/organization' => 'about#organization', as: 'about_organization'
  get 'about/team' => 'about#team', as: 'about_team'
  get 'about/advisory' => 'about#advisory', as: 'about_advisory'

  get 'communities/local' => 'communities#local', as: 'communities_mission'
  get 'communities/communities' => 'communities#communities', as: 'communities_communities'
  get 'communities/ouishare' => 'communities#ouishare', as: 'communities_ouishare'
  get 'communities/live' => 'communities#live', as: 'communities_live'
  get 'communities/people' => 'communities#people', as: 'communities_people'

  get 'knowledge' => 'knowledge#index', as: 'knowledge'
  get 'knowledge/research' => 'knowledge#research', as: 'knowledge_research'
  get 'knowledge/expert' => 'knowledge#expert', as: 'knowledge_expert'
  get 'knowledge/groups' => 'knowledge#groups', as: 'knowledge_groups'
  get 'knowledge/ouiki' => 'knowledge#ouiki', as: 'knowledge_ouiki'

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
