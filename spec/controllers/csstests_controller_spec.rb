require 'rails_helper'

RSpec.describe CsstestsController, type: :controller do 

	let(:test1) { Csstest.create }

	describe 'GET #index' do 

		it "returns HTTP success" do 
			test1, test2 = Csstest.create, Csstest.create
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it 'renders index template' do
			test1, test2 = Csstest.create, Csstest.create
			get :index 
			expect(response).to render_template('index')
		end 

		it 'assigns @tests' do 
			test1, test2 = Csstest.create, Csstest.create
			get :index
			expect(assigns(:tests)).to match_array([test1, test2])
		end

	end 

	describe 'GET #question1' do 

		before do 
			get :cssquestion1, params: {id:test1.id}
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders cssquestion1 template' do 
			expect(response).to render_template('cssquestion1')
		end

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe 'GET #cssquestion2' do 

		before do 
			get :cssquestion2, params: { id:test1.id }
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders cssquestion2 template' do 
			expect(response).to render_template('cssquestion2')
		end

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end

	end 

	describe 'GET #cssquestion3' do 

		before do 
			get :cssquestion3, params: { id: test1.id }
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders cssquestion3 template' do 
			expect(response).to render_template('cssquestion3')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe 'GET #cssquestion4' do 

		before do 
			get :cssquestion4, params: {id: test1.id }
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders cssquestion4 template' do 
			expect(response).to render_template('cssquestion4')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 
	end 

	describe "GET #cssquestion5" do 

		before do 
			get :cssquestion5, params: { id: test1.id }
		end 

		it "returns HTTP success" do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders question5 template" do 
			expect(response).to render_template('cssquestion5')
		end 

		it "assigns @test" do 
			expect(assigns(:test)).to eq(test1)
		end 

	end

	describe 'GET #cssquestion6' do 

		before do 
			get :cssquestion6, params: { id: test1.id }
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders cssquestion6 template' do 
			expect(response).to render_template('cssquestion6')
		end 

		it 'assigns @post' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end

	describe 'GET #cssquestion7' do 

		before do 
			get :cssquestion7, params: { id: test1.id }
		end 

		it 'return HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders cssquestion7 template' do 
			expect(response).to render_template('cssquestion7')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe 'GET #cssquestion8' do 

		before do 
			get :cssquestion8, params: { id: test1.id }
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders cssquestion8 template' do 
			expect(response).to render_template('cssquestion8')
		end

		it "assigns @test" do 
			expect(assigns(:test)).to eq(test1)
		end

	end 

	describe 'GET #cssquestion9' do 

		before do 
			get :cssquestion9, params: { id: test1.id }
		end

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders cssquestion9 template' do 
			expect(response).to render_template('cssquestion9')
		end

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end

	describe 'GET #cssquestion10' do 

		before do 
			get :cssquestion10, params: { id: test1.id }
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders cssquestion10 template' do 
			expect(response).to render_template('cssquestion10')
		end 

		it "assigns @test" do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe 'GET #cssresults' do 

		before do 
			get :cssresults, params: { id: test1.id }
		end 

		it "returns HTTP success" do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it "renders cssresults template" do 
			expect(response).to render_template('cssresults')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe 'DELETE #destroy' do 

		context "when not logged in" do 

			before do 
				delete :destroy, id: test1.id
			end

			it 'returns HTTP redirect' do 
				expect(response).to have_http_status(302)
			end

			# this test require config.include Devise::Test::ControllerHelpers, type: :controller 
			# be added to rails helper
			it "redirects to new_user_session_path" do 
				expect(response).to redirect_to new_user_session_path
			end 

			it 'does not delete test' do 
				expect(Csstest.all.count).to eq(1)
			end

		end 

	end 
end 