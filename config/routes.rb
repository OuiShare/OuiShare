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
      resources :projects do
        member do
          post :sort
        end
      end
      resources :events
      resources :community_pages
      resources :faq_pages
      resources :faq_questions do
        member do
          post :sort
        end
      end
      resources :faqs
      resources :missions
      resources :activities
      resources :timelines
      resources :governances
      resources :governance_pages
      resources :values
      resources :value_pages
      resources :team_pages
      resources :advisors_pages
      resources :communities do
        member do
          post :sort
        end
      end
      resources :cocreation_pages
      resources :cocreations
      resources :contact_pages
      resources :donation_pages
      resources :get_involved_pages
      resources :expert_groups_pages
      resources :expert_groups
      resources :organization_pages
      resources :terms_pages
      resources :live_pages
      resources :press_room_pages
      resources :funded_pages
      resources :funding_infos
      resources :research_pages
      resources :researches
      resources :workus_pages
      resources :services
      resources :regions do
        member do
          post :sort
        end
      end
      resources :collaborative_economy_pages
      resources :knowledge_pages
    end

    resources :users

    get '/' => 'home#index'
    get 'home' => 'home#home'
    get 'live' => 'home#about', as: 'about'
    get 'community_pages' => 'home#community_pages'
    get 'projects' => 'projects#index'
    get 'events' => 'events#index'
    get 'activities' => 'activities#index'
    get 'missions' => 'home#missions'
    get 'governances' => 'governances#index'
    get 'governance_pages' => 'home#governance_pages'
    get 'values' => 'values#index'
    get 'value_pages' => 'home#value_pages'
    get 'timelines' => 'home#timelines'
    get 'faq_pages' => 'home#faq_pages'
    get 'faq_questions' => 'faq_questions#index'
    get 'team_pages' => 'home#team_pages'
    get 'advisors_pages' => 'home#advisors_pages'
    get 'communities' => 'communities#index'
    get 'cocreation_pages' => 'home#cocreation_pages'
    get 'donation_pages' => 'home#donation_pages'
    get 'cocreations' => 'cocreations#index'
    get 'contact_pages' => 'home#contact_pages'
    get 'get_involved_pages' => 'home#get_involved_pages'
    get 'expert_groups_pages' => 'home#expert_groups_pages'
    get 'expert_groups' => 'expert_groups#index'
    get 'organization_pages' => 'home#organization_pages'
    get 'terms_pages' => 'home#terms_pages'
    get 'live_pages' => 'home#live_pages'
    get 'press_room_pages' => 'home#press_room_pages'
    get 'funded_pages' => 'home#funded_pages'
    get 'funding_infos' => 'funding_infos#index'
    get 'research_pages' => 'home#research_pages'
    get 'researches' => 'researches#index'
    get 'workus_pages' => 'home#workus_pages'
    get 'services' => 'services#index'
    get 'regions' => 'regions#index'
    get 'collaborative_economy_pages' => 'home#collaborative_economy_pages'
    get 'knowledge_pages' => 'home#knowledge_pages'
  end

  get 'projects/:id' => 'admin/projects#show', as: 'project'
  get 'events/:id' => 'admin/events#show', as: 'event'

  resources :donations, only: [:index]

  get 'newsletter'     => 'newsletter#index', as: 'newsletter'
  post 'newsletter/subscribe' => 'newsletter#subscribe', as: 'newsletter_subscribe'

  get 'live' => 'about#index', as: 'about'
  get 'team'  => 'team#index',  as: 'team'
  get 'communities' => 'communities#index', as: 'communities'
  get 'contact' => 'contact#index', as: 'contact'
  post 'contact' => 'contact#submit'
  get 'projects' => 'projects#index', as: 'projects'
  get 'events' => 'events#index', as: 'events'
  get 'faq' => 'faqs#index', as: 'faq'
  get 'terms' => 'home#terms', as: 'terms'

  get 'about' => 'about#mission', as: 'about_mission'
  get 'about/vision' => 'about#vision', as: 'about_vision'
  get 'about/story' => 'about#history', as: 'about_history'
  get 'about/organization' => 'about#organization', as: 'about_organization'
  get 'about/governance' => 'about#governance', as: 'about_governance'
  get 'about/values' => 'about#value', as: 'about_value'
  get 'about/team' => 'about#team', as: 'about_team'
  get 'about/advisory' => 'about#advisory', as: 'about_advisory'
  get 'about/how_we_are_funded' => 'about#funded', as: 'about_funded'
  get 'about/collaborative_economy' => 'about#collaborative_economy', as: 'about_collaborative_economy'

  get 'communities/local' => 'communities#local', as: 'communities_mission'
  get 'communities/communities' => 'communities#communities', as: 'communities_communities'
  get 'communities/ouishare' => 'communities#ouishare', as: 'communities_ouishare'
  get 'communities/live' => 'communities#live', as: 'communities_live'
  get 'communities/people' => 'communities#people', as: 'communities_people'
  get 'communities/knowledge_groups' => 'communities#expert_groups', as: 'expert_groups'

  get 'knowledge' => 'knowledge#index', as: 'knowledge'
  get 'knowledge/research' => 'knowledge#research', as: 'knowledge_research'
  get 'knowledge/expert' => 'knowledge#expert', as: 'knowledge_expert'
  get 'knowledge/groups' => 'knowledge#groups', as: 'knowledge_groups'
  get 'knowledge/ouiki' => 'knowledge#ouiki', as: 'knowledge_ouiki'
  get 'knowledge/cocreation' => 'knowledge#cocreation', as: 'knowledge_cocreation'

  get 'getinvolved' => 'getinvolved#index', as: 'getinvolved'
  get 'press' => 'press#index', as: 'press'
  get 'workus' => 'workus#index', as: 'workus'

  get 'users/:id' => 'admin/users#show', as: 'user'
  post 'donations/pay' => 'donations#pay', as: 'pay_donation'
  get "payments/success_callback"
  get "payments/cancel_callback"
  get 'donations/thank_you' => 'donations#thank_you'
end
