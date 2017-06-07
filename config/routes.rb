Rails.application.routes.draw do
  	devise_for :users  
 
  	get "/home", to: "pages#home", as: "home" 

 	resources :tests
	get "/tests/question1/:id", to: "tests#question1", as: 'question1'
	get "/tests/question2/:id", to: "tests#question2", as: 'question2'
	get "tests/question3/:id", to: "tests#question3", as: 'question3'
	get "tests/results/:id", to: "tests#results", as: 'results'
 	root "pages#home"

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
