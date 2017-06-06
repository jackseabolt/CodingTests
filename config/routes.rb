Rails.application.routes.draw do
  	devise_for :users  
 
 	resources :tests

	get "/tests/question1/:id", to: "tests#question1", as: 'question1'
	get "/tests/question2/:id", to: "tests#question2", as: 'question2'
	get "tests/question3/:id", to: "tests#question3", as: 'question3'

 	root "tests#index"

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
