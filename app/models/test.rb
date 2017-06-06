class Test < ApplicationRecord

	def question_one
		correct_answer = "jack"
		if params[:answer] == correct_answer
			flash.now[:success] = "That is correct!"
			new_score = @test.score += 1
			@test.update(score: new_score)
		elsif params[:answer] != correct_answer
			flash.now[:danger] = "Neutral" 
		end
	end 

end
