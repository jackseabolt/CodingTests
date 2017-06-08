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
	
	def cssquestion3 
		@test = Csstest.find(params[:id])
		correct_answer = "font-size"
		user_answer = params[:answer]
		if user_answer == correct_answer
			new_score = @test.score += 1
			if @test.score == 3
				flash.now[:success] = "You got all the questions right! Great!"
			elsif @test.score == 2 
				flash.now[:success] = "You finished! Great!"
			elsif @test.score == 1
				flash.now[:success] = "You finished, but we think you could do better"
			elsif @test.score == 0 
				flash.now[:danger] = "You didn't get any questions right. You should study some more"
			end
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "That is not what we were looking for" 
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
