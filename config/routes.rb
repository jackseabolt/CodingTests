Rails.application.routes.draw do
  	
  	#authentication routes	
  	devise_for :users  
 
  	get "/home", to: "pages#home", as: "home" 

  	#restful routes for all tests
 	resources :tests, :jstests, :csstests

 	#routes for html test
	get "/tests/question1/:id", to: "tests#question1", as: 'question1'
	get "/tests/question2/:id", to: "tests#question2", as: 'question2'
	get "/tests/question3/:id", to: "tests#question3", as: 'question3'
	get "/tests/question4/:id", to: "tests#question4", as: 'question4'
	get "/tests/question5/:id", to: 'tests#question5', as: "question5"
	get "/tests/question6/:id", to: 'tests#question6', as: "question6"
	get "/tests/question7/:id", to: 'tests#question7', as: "question7"
	get "/tests/question8/:id", to: 'tests#question8', as: "question8"
	get "/tests/question9/:id", to: 'tests#question9', as: "question9"
	get "/tests/question10/:id", to: 'tests#question10', as: "question10"
	get "/tests/results/:id", to: "tests#results", as: 'results'

	#routes for javascript test
	get "/jstests/question1/:id", to: "jstests#jsquestion1", as: 'jsquestion1'
	get "/jstests/question2/:id", to: "jstests#jsquestion2", as: 'jsquestion2'
	get "/jstests/question3/:id", to: "jstests#jsquestion3", as: 'jsquestion3'
	get "/jstests/results/:id", to: "jstests#jsresults", as: 'jsresults'

	#routes for css test
	get "/csstests/question1/:id", to: "csstests#cssquestion1", as: 'cssquestion1'
	get "/csstests/question2/:id", to: "csstests#cssquestion2", as: 'cssquestion2'
	get "/csstests/question3/:id", to: "csstests#cssquestion3", as: 'cssquestion3'
	get "/csstests/results/:id", to: "csstests#cssresults", as: 'cssresults'

	#root path
 	root "pages#home"

end
