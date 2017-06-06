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
			flash.now[:danger] = "Wrong answer" 
		end
	end

	def question2
		@test = Test.find(params[:id])
		correct_answer = "<style>"
		user_answer = params[:answer2]
		if user_answer == correct_answer
			new_score = @test.score  += 1
			if @test.score == 2
				flash.now[:success] = "That's also right! Good job!"
			else
				flash.now[:success] = "That is correct!"
			end 
			@test.update(score: new_score)
		elsif params[:answer2].present? && params[:answer2] != correct_answer
			flash.now[:danger] = "That is incorrect"
		end  
	end 
	
	def question3 
		@test = Test.find(params[:id])
		correct_answer = "</div>"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score += 1
			if @test.score == 3
				flash.now[:success] = "You got all the questions right! Great!"
			elsif @test.score == 2 
				flash.now[:success] = "You finished! Great!"
			else 
				flash.now[:success] = "You finished, but we think you could do better"
			end
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is not what we were looking for" 
		end
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
			redirect_to root_path 
		end 
	end 

	private 

		def test_params
			params.require(:test).permit(:score, :user_id)
		end
end
