TermProject::Application.routes.draw do
  root to: 'about#index'
    get "/", :to => 'about#index' , :as => 'about'
    get "about/", :to => 'about#index' , :as => 'about'
    get "about/index", :to => 'about#index' , :as => 'about'
end
