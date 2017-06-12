require 'rails_helper'

RSpec.describe TestsController, type: :controller do
	
	let(:test1) { Test.create }

	describe "GET #index" do 

		it "returns HTTP success" do
			test1, test2 = Test.create, Test.create
			get :index
			expect(response).to have_http_status(200)
			expect(response).to be_success
		end 

		it "render index template" do
			test1, test2 = Test.create, Test.create
			get :index 
			expect(response).to render_template('index')
		end 

		it "assigns all tests to @tests" do
			test1, test2 = Test.create, Test.create 
			get :index
			expect(assigns(:tests)).to match_array([test1, test2])
		end 

	end 

	describe 'GET #question1' do 

		before do 
			get :question1, params: {id: test1.id}
		end 

		it "returns with HTTP success" do
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders question1 template" do 
			expect(response).to render_template('question1')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end

	end 

	describe "GET #question2" do 

		before do 
			get :question2, params: {id:test1.id}
		end 

		it "returns with HTTP success" do
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it "renders question2 template" do 
			expect(response).to render_template('question2')
		end 

		it "assigns @test" do 
			expect(assigns(:test)).to eq(test1)
		end  

	end 

	describe "GET #question3" do 

		before do 
			get :question3, params: {id:test1.id}
		end 

		it "returns with HTTP success" do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it "renders the question3 template" do 
			expect(response).to render_template('question3')
		end 

		it "assigns @test" do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe 'GET #question4' do 

		before do 
			get :question4, params: {id:test1.id}
		end

		it "returns with HTTP success" do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it "renders question4 template" do 
			expect(response).to render_template('question4')
		end 

		it "assigns @test" do 
			expect(assigns(:test)).to eq(test1)
		end 	

	end 

	describe "GET #question5" do 

		before do 
			get :question5, params: { id:test1 }
		end 
	
		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders question4 template' do 
			expect(response).to render_template('question5')
		end

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 

	end

	describe "GET #question6" do 

		before do 
			get :question6, params: {id:test1.id}
		end 

		it 'returns with HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it 'renders question6 template' do 
			expect(response).to render_template('question6')
		end 

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end

	end 

	describe "GET #question7" do 

		before do 
			get :question7, params: {id:test1.id}
		end 

		it "returns HTTP success" do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it "renders question7 template" do 
			expect(response).to render_template('question7')
		end 

		it "assigns @test" do 
			expect(assigns(:test)).to eq(test1)
		end

	end 

	describe "GET #question8" do 

		before do 
			get :question7, params: {id:test1.id}
		end 

		it "returns HTTP success" do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it "assigns @test" do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe "GET #question9" do 

		before do 
			get :question9, params: {id: test1.id}
		end 

		it "returns HTTP success" do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it "renders question9 template" do 
			expect(response).to render_template('question9')
		end 

		it "assigns @test" do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe "GET question10" do 

		before do 
			get :question10, params: {id:test1.id}
		end 

		it "returns HTTP success" do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it "renders question10 template" do 
			expect(response).to render_template('question10')
		end 

		it "assigns @test" do 
			expect(assigns(:test)).to eq(test1)
		end 

	end 

	describe "GET results" do 

		before do 
			get :results, params: {id:test1.id}
		end 

		it "returns HTTP success" do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it "renders results template" do 
			expect(response).to render_template('results')
		end

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end 
	end 

end
