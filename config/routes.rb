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
      resources :articles_sections
      resources :take_part_sections
      resources :partners
      resources :about
      resources :projects
      resources :events
      resources :community_pages
      resources :faqs
      resources :missions
    end
    get '/' => 'home#index'
    get 'home' => 'home#home'
    get 'about' => 'home#about'
    get 'community_pages' => 'home#community_pages'
    get 'projects' => 'projects#index'
    get 'events' => 'events#index'
    get 'missions' => 'home#missions'
  end

  get 'projects/:id' => 'admin/projects#show', as: 'project'
  get 'events/:id' => 'admin/events#show', as: 'event'

  resources :donations

  get 'newsletter'     => 'newsletter#index', as: 'newsletter'
  post 'newsletter/subscribe' => 'newsletter#subscribe', as: 'newsletter_subscribe'

  get 'about' => 'about#index', as: 'about'
  get 'team'  => 'team#index',  as: 'team'
  get 'communities' => 'communities#index', as: 'communities'
  get 'contact' => 'contact#index', as: 'contact'
  post 'contact' => 'contact#submit'
  get 'projects' => 'projects#index', as: 'projects'
  get 'events' => 'events#index', as: 'events'
  get 'faq' => 'faqs#index', as: 'faq'

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

  resources :users
end
