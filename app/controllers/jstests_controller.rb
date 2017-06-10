class JstestsController < ApplicationController
	before_action :authenticate_user!, only: [:destroy]
	
	def index 
		@test = Jstest.new 
		@tests = Jstest.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 4)
	end 

	def jsquestion1 
		@test = Jstest.find(params[:id])
		correct_answer = "<script>"
		user_answer = params[:answer]
		if user_answer == correct_answer
			flash.now[:success] = "That is correct!"
			new_score = @test.score += 1
			@test.update(score: new_score)
		elsif params[:answer].present? && params[:answer] != correct_answer
			flash.now[:danger] = "Wrong answer" 
		end
	end

	def jsquestion2
		@test = Jstest.find(params[:id])
		correct_answer = "document.getElementById('target');"
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
	
	def jsquestion3 
		@test = Jstest.find(params[:id])
		correct_answer = "var x = document.getElementById('target');"
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

	def jsquestion4
		@test = Jstest.find(params[:id])
		correct_answer = "option1"
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

	def jsquestion5
		@test = Jstest.find(params[:id])
		correct_answer = 'true'
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

	def jsquestion6
		@test = Jstest.find(params[:id])
		correct_answer = "option3"
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

	def jsquestion7
		@test = Jstest.find(params[:id])
		correct_answer = "option1"
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

	def jsquestion8
		@test = Jstest.find(params[:id])
		correct_answer = "option1"
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

	def jsquestion9
		@test = Jstest.find(params[:id])
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
			flash.now[:danger] = "That is incorrect"
		end  
	end 

	def jsquestion10
		@test = Jstest.find(params[:id])
		correct_answer = "option3"
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

	def jsresults
		@test = Jstest.find(params[:id])
	end

	def create 
		@test = Jstest.create(test_params)
		if @test.save 
			redirect_to jsquestion1_path(@test)
		else 
			flash[:danger] = "There was a problem"
			render "jsquestion1" 
		end 
	end 

	def destroy 
		@test = Jstest.find(params[:id])
		if @test.destroy
			flash.now[:success] = "Your test was removed"
			redirect_to jstests_path 
		end 
	end 

	private 

		def test_params
			params.require(:jstest).permit(:score, :user_id)
		end


end
