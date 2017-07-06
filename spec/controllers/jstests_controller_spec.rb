require 'rails_helper'

RSpec.describe JstestsController, type: :controller do 

	let(:test1){ Jstest.create}

	describe 'GET #jsquestion1' do 

		before do 
			get :jsquestion1, params: { id: test1.id }
		end

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it 'renders jsquestion1 template' do 
			expect(response).to render_template('jsquestion1')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 	

	end

	describe 'GET #jsquestion2' do 

		before do 
			get :jsquestion2, params: { id: test1.id }
		end 

		it "returns HTTP success" do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders jsquestion2 template' do 
			expect(response).to render_template('jsquestion2')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe 'GET #jsquestion3' do 

		before do 
			get :jsquestion3, params: { id: test1.id }
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders jsquestion3 template' do 
			expect(response).to render_template('jsquestion3')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe 'GET #jsquestion4' do 

		before do 
			get :jsquestion4, params: { id: test1.id }
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders jsquestion4 template' do 
			expect(response).to render_template('jsquestion4')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end	

	describe 'GET #jsquestion5' do 

		before do 
			get :jsquestion5, params: { id: test1.id }
		end 

		it 'returns HTPP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders jsquestion5 template' do 
			expect(response).to render_template('jsquestion5')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe 'GET #jsquestion6' do 

		before do 
			get :jsquestion6, params: { id: test1.id }
		end 

		it 'returns HTPP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders jsquestion6 template' do 
			expect(response).to render_template('jsquestion6')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 
	
	end 

	describe 'GET #jsquestion7' do 

		before do 
			get :jsquestion7, params: { id: test1.id }
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders jsquestion7 template' do 
			expect(response).to render_template('jsquestion7')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe 'GET #jsquestion8' do 

		before do 
			get :jsquestion8, params: { id: test1.id }
		end

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders jsquestion8 template' do 
			expect(response).to render_template('jsquestion8')
		end 	

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe 'GET #jsquestion9' do 

		before do 
			get :jsquestion9, params: { id: test1.id }
		end

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders jsquestion9 template' do 
			expect(response).to render_template('jsquestion9')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end

	end 

	describe 'GET #jsquestion10' do 

		before do 
			get :jsquestion10, params: { id: test1.id }
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders jsquestion10 template' do 
			expect(response).to render_template('jsquestion10')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end

	end 

	describe 'GET #jsresults' do 

		before do 
			get :jsresults, params: { id: test1.id }
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders jsresults template' do 
			expect(response).to render_template('jsresults')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe 'DELETE #delete' do 

		before do 
			delete :destroy, params: { id: test1.id }
		end 

		context 'without loggin in' do 

			it 'returns HTTP redirect' do 
				expect(response).to have_http_status(302)
			end 

			# this test require config.include Devise::Test::ControllerHelpers, type: :controller 
			# be added to rails helper
			it 'redirects to new_user_session path' do 
				expect(response).to redirect_to new_user_session_path
			end 

			it 'does not delete jstest' do 
				expect(Jstest.all.count).to eq(1)
			end 

		end 

	end 

end 
