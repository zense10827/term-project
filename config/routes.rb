TermProject::Application.routes.draw do

  get "teacher/all"

  get "teacher/add"

  get "teacher/index"

  get "teacher/:TID", to: 'teacher#index', as: :tid
  get "course/index"
  get "course/add"
  get "course/about"
  get "course/search"
  post "course/information/:id/edit/update", to: 'course#update', as: :id
  post "course/search", to: 'course#search'
  get "course/information/:id/edit", to: 'course#edit', as: :id
  get "course/information/:id", to: 'course#information', as: :id
  resources :course,:teacher
  root :to => redirect('/course/index')
end
