Rails.application.routes.draw do
  get 'faculties/index'
  get 'faculties/new'
  get 'facultys/index'
  get 'student1s/index'
  get 'authors/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

   root "authors#index"
   resources :authors 
   
   resources :books
   
   resources :authors do
    resources :books
   end
 
   get "/books/new/:id", to: "books#new"
   get "/books", to: "books#index"
   get "/joindata/:id", to: "datas#index"
   
   # =========== student1 resoucres ===========
   resources :student1s

   resources :faculties

end
