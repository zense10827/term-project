TermProject::Application.routes.draw do
  get "timetable/view"
  get "timetable/regis"
  get "user/add"
  get "user/index"
  get "user/login"
  post "user/login", to: 'user#login'
  get "timetable/index"
  get "teacher/all"
  get "teacher/add"
  get "teacher/index"
  get "teacher/:TID", to: 'teacher#index', as: :tid
  get "course/index"
  get "course/add"
  get "course/about"
  get "course/search"
  get "course/menu"
  post "course/information/:id/edit/update", to: 'course#update', as: :id
  post "course/search", to: 'course#search'
  post "timetable/view", to: 'timetable#view'
  post "timetable/regis", to: 'timetable#regis'
  get "timetable/view/:id", to: 'timetable#view', as: :id
  get "course/information/:id/edit", to: 'course#edit', as: :id
  get "course/information/:id", to: 'course#information', as: :id
  resources :course,:teacher,:user,:timetable
  root :to => redirect('/course/index')
end
