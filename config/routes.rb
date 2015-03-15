TermProject::Application.routes.draw do
  resources :about
  root to: 'about#index'
  get "about/", :to => 'about#index' , :as => 'about'
  get "about/index", :to => 'about#index' , :as => 'about'
end
