class TestsController < ApplicationController

	def index 
		@test = Test.new 
		@tests = Test.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 4)
	end 

	def question1 
		@test = Test.find(params[:id])
		correct_answer = "<p>"
		user_answer = params[:answer]
		if user_answer == correct_answer
			flash.now[:success] = "That is correct!"
			new_score = @test.score += 1
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "Wrong answer." 
		end
	end

	def question2
		@test = Test.find(params[:id])
		correct_answer = "true"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 2
				flash.now[:success] = "That's also right! Good job!"
			else
				flash.now[:success] = "That is correct!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is incorrect."
		end  
	end 
	
	def question3 
		@test = Test.find(params[:id])
		correct_answer = "</div>"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score += 1
			if @test.score == 3
				flash.now[:success] = "You got all the questions right so far! Great!"
			elsif @test.score == 2 
				flash.now[:success] = "You're doing great!"
			elsif @test.score == 1
				flash.now[:success] = "You got it right!"
			elsif @test.score == 0 
				flash.now[:danger] = "You haven't gotten any questions right so far."
			end
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is not what we were looking for." 
		end
	end

	def question4
		@test = Test.find(params[:id])
		correct_answer = "false"
		user_answer = params[:answer]
		if correct_answer == user_answer
			new_score = @test.score += 1
			if @test.score == 4
				flash.now[:success] = "You got the question right!"
			elsif @test.score < 4 && @test.score > 0
				flash.now[:success] = "You got the question right!"
			else
				flash.now[:danger] = "You got that one right!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That isn't what we wanted."
		end
	end 


	def question5
		@test = Test.find(params[:id])
		correct_answer = "option2"
		user_answer = params[:answer]
		if correct_answer == user_answer
			new_score = @test.score += 1
			if @test.score == 5
				flash.now[:success] = "You got it right! Amazing!"
			elsif @test.score < 5 && @test.score > 0
				flash.now[:success] = "You got the question right!"
			else
				flash.now[:danger] = "You got that one right!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That isn't what we wanted."
		end
	end 

	def question6
		@test = Test.find(params[:id])
		correct_answer = "false"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 6
				flash.now[:success] = "That's also right! Good job!"
			else
				flash.now[:success] = "That is correct!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is incorrect."
		end  
	end 

	def question7
		@test = Test.find(params[:id])
		correct_answer = "option3"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 7
				flash.now[:success] = "That's also right! You're doing great!"
			else
				flash.now[:success] = "That is correct!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is incorrect."
		end  
	end 

	def question8
		@test = Test.find(params[:id])
		correct_answer = "option1"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 8
				flash.now[:success] = "All questions right so far! Good job!"
			else
				flash.now[:success] = "That is correct! Good job!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is incorrect."
		end  
	end 

	def question9
		@test = Test.find(params[:id])
		correct_answer = "true"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 9
				flash.now[:success] = "That's also right! Good job!"
			else
				flash.now[:success] = "That is correct!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is incorrect."
		end  
	end 

	def question10
		@test = Test.find(params[:id])
		correct_answer = "option3"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 10
				flash.now[:success] = "You got all of the questions right! Amazing!"
			else
				flash.now[:success] = "That is correct!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is incorrect."
		end  
	end 

	def results
		@test = Test.find(params[:id])
	end

	def create 
		@test = Test.create(test_params)
		if @test.save 
			redirect_to question1_path(@test)
		else 
			flash[:danger] = "There was a problem"
			render "question1" 
		end 
	end 

	def destroy 
		@test = Test.find(params[:id])
		if @test.destroy
			flash.now[:success] = "Your test was removed"
			redirect_to tests_path 
		end 
	end 

	private 

		def test_params
			params.require(:test).permit(:score, :user_id)
		end
end
