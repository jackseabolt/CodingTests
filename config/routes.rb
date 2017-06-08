Rails.application.routes.draw do
  	
  	#authentication routes	
  	devise_for :users  
 
  	get "/home", to: "pages#home", as: "home" 

  	#restful routes for all tests
 	resources :tests, :jstests

 	#routes for html test
	get "/tests/question1/:id", to: "tests#question1", as: 'question1'
	get "/tests/question2/:id", to: "tests#question2", as: 'question2'
	get "/tests/question3/:id", to: "tests#question3", as: 'question3'
	get "/tests/results/:id", to: "tests#results", as: 'results'

	#routes for javascript test
	get "/jstests/question1/:id", to: "jstests#jsquestion1", as: 'jsquestion1'
	get "/jstests/question2/:id", to: "jstests#jsquestion2", as: 'jsquestion2'
	get "/jstests/question3/:id", to: "jstests#jsquestion3", as: 'jsquestion3'
	get "/jstests/results/:id", to: "jstests#jsresults", as: 'jsresults'

	#root path
 	root "pages#home"

end
