require 'rails_helper'

feature "taking test" do 

	scenario "with correct answers" do 
		visit '/'
		click_link "HTML Test"
		click_button "Start"
		fill_in "answer", with: '<p>'
  		click_button 'Submit'
  		sleep 5
  		click_link 'Next Question'
  		expect(page).to have_content('CSS helps you control the appearance of HTML elements.')
	end

end 