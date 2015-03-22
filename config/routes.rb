TermProject::Application.routes.draw do

  get "teacher/all"

  get "teacher/add"

  get "teacher/index"

  get "teacher/:TID", to: 'teacher#index', as: :tid
  get "course/index"
  get "course/add"
  get "course/about"
  resources :course,:teacher
  root :to => redirect('/course/index')
end
