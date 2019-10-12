require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe 'GET #new' do
		it 'renders a new template' do
			get :new
			expect(response).to render_template("new")
		end
	end

	describe 'POST #create' do
		context 'with invalid params' do
			it "validates the presence of the user's email and password" do
				post :create, params: {user: {email: nil, password: nil}}
				expect(response).to render_template('new')
				expect(flash[:errors]).to be_present
			end

			it "validates that the password is at least 6 characters long" do
				post :create, params: { user: {email: 'MrTest@gmail.com', password: '1234'}}
				expect(response).to render_template('new')
				expect(flash[:errors]).to be_present
			end
		end

		context 'with valid params' do
			it "redirects user to bands index on success" do
				post :create, params: { user: {email: 'Test@gmail.com', password: '123456'}}
				expect(response).to redirect_to(bands_url)
			end
		end
	end
=begin
	describe 'GET #show' do
		context 'if there is a user' do
			it 'renders the show template' do
				get :show
				expect(response).to render_template('show')
			end
		end

		context "if there isn't a user" do
			it 'redirects to new user page on failure' do
				get :show
				expect(response).to redirect_to(new_user_url)
				expect(flash[:errors]).to be_present
			end
		end
	end
=end
end
