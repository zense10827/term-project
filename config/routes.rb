TermProject::Application.routes.draw do


  resources :about
  root :to => redirect('/about')
  get "about/index"
end
