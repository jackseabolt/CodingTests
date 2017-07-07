require 'rails_helper'

feature 'taking jstest' do 

	scenario 'with all correct answers' do 

		visit '/'
		click_link "JavaScript Test"
		click_button "Start"

		choose 'answer_option2'
		click_button "Submit"
		click_link "Next Question"

		choose 'answer_option3'
		click_button "Submit"
		click_link "Next Question"

		choose 'answer_option1'
		click_button "Submit"
		click_link "Next Question"

		choose "answer_option1"
		click_button "Submit"
		click_link "Next Question"

		choose "answer_true"
		click_button "Submit"
		click_link "Next Question"

		choose "answer_option3"
		click_button "Submit"
		click_link "Next Question"

		choose "answer_option1"
		click_button "Submit"
		click_link "Next Question"

		choose "answer_option1"
		click_button "Submit"
		click_link "Next Question"

		choose "answer_true"
		click_button "Submit"
		click_link "Next Question"

		choose "answer_option3"
		click_button "Submit"
		click_link "Finish"

		expect(page).to have_content("10/10")
		expect(page).to have_content("That's perfect! Good job!")
		expect(page).to have_css('.trophy')
		expect(page).to have_content("Finish")

	end 

	scenario "with all incorrect answers" do 

		visit '/'
		click_link "JavaScript Test"
		click_button "Start"

		choose 'answer_option1'
		click_button "Submit"
		click_link "Next Question"

		choose 'answer_option2'
		click_button "Submit"
		click_link "Next Question"

		choose 'answer_option2'
		click_button "Submit"
		click_link "Next Question"

		choose "answer_option3"
		click_button "Submit"
		click_link "Next Question"

		choose "answer_false"
		click_button "Submit"
		click_link "Next Question"

		choose "answer_option2"
		click_button "Submit"
		click_link "Next Question"

		choose "answer_option2"
		click_button "Submit"
		click_link "Next Question"

		choose "answer_option2"
		click_button "Submit"
		click_link "Next Question"

		choose "answer_false"
		click_button "Submit"
		click_link "Next Question"

		choose "answer_option2"
		click_button "Submit"
		click_link "Finish"

		expect(page).to have_content("0/10")
		expect(page).to have_content("Practice makes perfect!")
		expect(page).to have_no_css('.trophy')
		expect(page).to have_content("Finish")

	end 

end 