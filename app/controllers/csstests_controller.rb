class CsstestsController < ApplicationController

	def index 
		@test = Csstest.new 
		@tests = Csstest.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 4)
	end 

	def cssquestion1 
		@test = Csstest.find(params[:id])
		correct_answer = "<style>"
		user_answer = params[:answer]
		if user_answer == correct_answer
			flash.now[:success] = "That is correct!"
			new_score = @test.score += 1
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "Wrong answer" 
		end
	end

	def cssquestion2
		@test = Csstest.find(params[:id])
		correct_answer = "#"
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
			flash.now[:danger] = "That is incorrect"
		end  
	end 
	
	def cssquestion3 
		@test = Csstest.find(params[:id])
		correct_answer = "font-size"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score += 1
			if @test.score == 3
				flash.now[:success] = "You've got it! Great!"
			elsif @test.score == 2 
				flash.now[:success] = "That's correct! Great!"
			elsif @test.score == 1
				flash.now[:success] = "Good job! That's right!"
			elsif @test.score == 0 
				flash.now[:danger] = "You got that one!"
			end
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is not what we were looking for." 
		end
	end

	def cssquestion4
		@test = Csstest.find(params[:id])
		correct_answer = "option1"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 4
				flash.now[:success] = "That's also right! Good job!"
			else
				flash.now[:success] = "That is correct!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is incorrect."
		end  
	end 

	def cssquestion5
		@test = Csstest.find(params[:id])
		correct_answer = "."
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 5
				flash.now[:success] = "That's also right! Good job!"
			else
				flash.now[:success] = "That is correct!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is not what we were looking for."
		end  
	end

	def cssquestion6
		@test = Csstest.find(params[:id])
		correct_answer = "true"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 6
				flash.now[:success] = "Good job!"
			else
				flash.now[:success] = "That is correct!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is incorrect."
		end  
	end 

	def cssquestion7
		@test = Csstest.find(params[:id])
		correct_answer = "option3"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 7
				flash.now[:success] = "Correct! You're on a roll!"
			else
				flash.now[:success] = "You got it!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is not what we were looking for."
		end  
	end  

	def cssquestion8
		@test = Csstest.find(params[:id])
		correct_answer = "option2"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 8
				flash.now[:success] = "You've gotten all the questions right so far! Good job!"
			else
				flash.now[:success] = "That's the right answer!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is incorrect."
		end  
	end 

	def cssquestion9
		@test = Csstest.find(params[:id])
		correct_answer = "padding"
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
			flash.now[:danger] = "That is not what we were looking for."
		end  
	end 

	def cssquestion10
		@test = Csstest.find(params[:id])
		correct_answer = "option2"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 10
				flash.now[:success] = "You got all the questions right! Wow!"
			else
				flash.now[:success] = "You got it! Good job!"
			end 
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is incorrect."
		end  
	end 

	def cssresults
		@test = Csstest.find(params[:id])
	end

	def create 
		@test = Csstest.create(test_params)
		if @test.save 
			redirect_to cssquestion1_path(@test)
		else 
			flash[:danger] = "There was a problem"
			render "cssquestion1" 
		end 
	end 

	def destroy 
		@test = Csstest.find(params[:id])
		if @test.destroy
			flash.now[:success] = "Your test was removed"
			redirect_to csstests_path 
		end 
	end 

	private 

		def test_params
			params.require(:csstest).permit(:score, :user_id)
		end






end
