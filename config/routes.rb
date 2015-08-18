Jensenlocksmithing::Application.routes.draw do

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    get "log_out" => "sessions#destroy", as: "log_out"
    get "login" => "sessions#new", as: "login"

    get "home" => "page#home"
    get "services" => "page#services"
    get "frequently_asked_questions" => "page#faq"
    get "discounts_coupons" => "page#discounts" 
    get "contact_us" => "page#contact_us"

    resources :reviews, only: [:new, :create]
    resources :blogs, only: [:index, :show]

    namespace :admin do
      root to: 'page#panel'
      get "panel" => "page#panel"
      match "/savesort" => 'admin/categories#savesort'

      resources :page_headers
      resources :monthly_posts
      resources :coupons
      resources :logos
      resources :faqs 
      resources :blogs
      
      resources :categories, except: [:index, :show] do
        collection do
          post :sort 
          get :new_subcategory
          get :edit_subcategory
        end
      end

      resources :reviews, except: [:new, :show, :destroy, :create]
      resources :contacts, except: [:new, :show, :destroy, :create]
      resources :users

      resources :products do
        member do
          put :move_up
          put :move_down
        end 
      end
    end
    #End Admin Namespace

    

    # Is this needed?
    resources :children, :controller => :categories, :only => [:index, :new, :create, :new_subcategory]
   
  resources :sessions

  root to: 'page#home' # handles /en/
    
  match "*path", to: "page#not_found" # handles /en/fake/path/whatever
  end 

  root to: redirect("/#{I18n.default_locale}") # handles /
  match 'request_bid' => 'request_bid#new', :as => 'request_bid', :via => :get
  match 'request_bid' => 'request_bid#create', :as => 'request_bid', :via => :post
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}")

end
