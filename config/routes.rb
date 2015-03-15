TermProject::Application.routes.draw do
  resources :about
  root :to => redirect('/about')
end
