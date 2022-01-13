Rails.application.routes.draw do
  # get 'students/index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
 
  resources :students  # we have to always use plural table name in resources
  root "students#index" 
  # delete "/students/:id", to: "students#destroy"
end

