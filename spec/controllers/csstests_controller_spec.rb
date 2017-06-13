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
			get :cssquestion2, params { id:test1.id }
		end 

		it 'returns HTTP success' do 
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end 

		it 'renders cssquestion2 template' do 
			expect(response).to render_tempalte('cssquestion2')
		end

		it 'assigns @test' do 
			expect(assigns(:test)).to eq(test1)
		end

	end 

	describe 'GET #cssquestion3' do 

		before do 
			get :cssquestion3, params { id: test1.id }
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

	decribe 'GET #cssquestion4' do 


	end 


end 