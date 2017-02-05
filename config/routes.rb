OuiShare::Application.routes.draw do
  resources :authorizations, only: [:destroy]
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations"}
  root :to => "home#index"

  devise_scope :user do
    get 'register', :to => "registrations#new"
    get 'register/thanks', :to => "registrations#thank_you"
  end

  filter :locale, exclude: /\/auth\//

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  mount RuCaptcha::Engine => "/rucaptcha"

  namespace :admin do
    resources :languages do
      resources :top_banners
      resources :what_is_sections
      resources :hot_projects_sections
      resources :events_sections
      resources :articles_sections
      resources :take_part_sections
      resources :partners
      resources :navmap
      resources :about
      resources :projects do
        member do
          post :sort
        end
      end
      resources :events do
        collection do
          get 'autocomplete'
        end
      end
      resources :community_pages
      resources :faq_pages
      resources :faq_questions do
        member do
          post :sort
        end
      end
      resources :faqs
      resources :missions
      resources :activities do
        member do
          post :sort
        end
      end
      resources :timelines
      resources :governances
      resources :governance_pages
      resources :values
      resources :value_pages
      resources :team_pages
      resources :alumni_pages
      resources :users_pages
      resources :advisors_pages
      resources :communities do
        member do
          post :sort
        end
        collection do
          get 'autocomplete'
        end
      end
      resources :cocreation_pages
      resources :cocreations
      resources :contact_pages
      resources :donation_pages
      resources :registrations_pages
      resources :get_involved_pages
      resources :expert_groups_pages
      resources :expert_groups do
        member do
          post :sort
        end
      end
      resources :organization_pages
      resources :terms_pages
      resources :live_pages
      resources :press_room_pages
      resources :funded_pages
      resources :funding_infos
      resources :research_pages
      resources :researches do
        member do
          post :sort
        end
      end
      resources :workus_pages
      resources :services do
        member do
          post :sort
        end
      end
      resources :regions do
        member do
          post :sort
        end
      end
      resources :collaborative_economy_pages
      resources :knowledge_pages
      resources :testimonials
    end

    resources :users, except: [:show]

    get '/' => 'home#index'
    get 'home' => 'home#home'
    get 'live' => 'home#about', as: 'about'
    get 'community_pages' => 'home#community_pages'
    get 'projects' => 'projects#index'
    get 'events' => 'events#index'
    get 'activities' => 'activities#index'
    get 'missions' => 'home#missions'
    get 'navmap' => 'home#navmap'
    get 'governances' => 'governances#index'
    get 'governance_pages' => 'home#governance_pages'
    get 'values' => 'values#index'
    get 'value_pages' => 'home#value_pages'
    get 'timelines' => 'home#timelines'
    get 'faq_pages' => 'home#faq_pages'
    get 'faq_questions' => 'faq_questions#index'
    get 'team_pages' => 'home#team_pages'
    get 'alumni_pages' => 'home#alumni_pages'
    get 'users_pages' => 'home#users_pages'
    get 'advisors_pages' => 'home#advisors_pages'
    get 'communities' => 'communities#index'
    get 'cocreation_pages' => 'home#cocreation_pages'
    get 'donation_pages' => 'home#donation_pages'
    get 'registrations_pages' => 'home#registrations_pages'
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
    get 'testimonials' => 'home#testimonials'
  end

  get 'profile/:id' => 'admin/users#show', as: 'user'

  get 'projects/:id' => 'admin/projects#show', as: 'project'
  get 'events/:id' => 'admin/events#show', as: 'event'

  resources :donations, only: [:index]

  get 'newsletter'     => 'newsletter#index', as: 'newsletter'
  post 'newsletter/subscribe' => 'newsletter#subscribe', as: 'newsletter_subscribe'

  get 'live' => 'about#index', as: 'about'
  get 'communities' => 'communities#index', as: 'communities'
  get 'community/:id' => 'communities#show', as: 'community'
  post 'community/:id/join' => 'communities#join', as: 'join_community'
  post 'community/:id/leave' => 'communities#leave', as: 'leave_community'
  get 'contact' => 'contact#index', as: 'contact'
  post 'contact' => 'contact#submit'
  get 'projects' => 'projects#index', as: 'projects'
  get 'events' => 'events#index', as: 'events'
  get 'past-events' => 'events#past_events', as: 'past_events'
  get 'faq' => 'faqs#index', as: 'faq'
  get 'terms' => 'home#terms', as: 'terms'

  get 'about' => 'about#mission', as: 'about_mission'
  get 'about/vision' => 'about#vision', as: 'about_vision'
  get 'about/story' => 'about#history', as: 'about_history'
  get 'about/organization' => 'about#organization', as: 'about_organization'
  get 'about/governance' => 'about#governance', as: 'about_governance'
  get 'about/values' => 'about#value', as: 'about_value'
  get 'about/team' => 'about#team', as: 'about_team'
  get 'about/alumni' => 'about#alumni', as: 'about_alumni'
  get 'about/advisory' => 'about#advisory', as: 'about_advisory'
  get 'about/how_we_are_funded' => 'about#funded', as: 'about_funded'
  get 'about/collaborative_economy' => 'about#collaborative_economy', as: 'about_collaborative_economy'
  get '/global-partners' => 'globalpartners#index', as: 'global_partners'
  get 'communities/local' => 'communities#local', as: 'communities_mission'
  get 'communities/communities' => 'communities#communities', as: 'communities_communities'
  get 'communities/ouishare' => 'communities#ouishare', as: 'communities_ouishare'
  get 'ouishare-everywhere' => 'communities#live', as: 'communities_live'
  get 'communities/people' => 'communities#people', as: 'communities_people'
  get 'communities/knowledge_groups' => 'communities#expert_groups', as: 'expert_groups'

  get 'knowledge' => 'knowledge#index', as: 'knowledge'
  get 'knowledge/research' => 'knowledge#research', as: 'knowledge_research'
  get 'knowledge/expert' => 'knowledge#expert', as: 'knowledge_expert'
  get 'knowledge/groups' => 'knowledge#groups', as: 'knowledge_groups'
  get 'knowledge/ouiki' => 'knowledge#ouiki', as: 'knowledge_ouiki'

  get 'media' => 'knowledge#cocreation', as: 'knowledge_cocreation'


  get 'get-involved' => 'getinvolved#index', as: 'getinvolved'
  get 'press-room' => 'press#index', as: 'press'
  get 'work-with-us' => 'workus#index', as: 'workus'

  post 'donations/pay' => 'donations#pay', as: 'pay_donation'
  get "payments/success_callback"
  get "payments/cancel_callback"
  get 'donations/thank_you' => 'donations#thank_you'

  get '/get_communities_select' => 'communities#get_communities_select'
  get '/get_communities_partial' => 'communities#get_communities_partial'
  get '/get_community_partial' => 'communities#get_community_partial'

  match '/search' => 'search#search', as: :search, via: [:get, :post]
  get '/autocomplete_query' => 'search#autocomplete_query'


  get '/:id(/*path)' => redirect{ |params| 'http://magazine.ouishare.net/' + params[:id] + params[:path] }, :constraints => { :id => /[0-9]*/ }
end
