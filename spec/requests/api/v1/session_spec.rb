require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe 'sessions', type: :request do
  let(:valid_attributes) do
    attributes_for(:user)
  end

  let(:invalid_attributes) do
    attributes_for(:user, password: nil)
  end

  let(:valid_headers) do
    return { 'Content-Type': 'application/json' }
  end

  describe 'POST /sign_in' do
    context 'with valid parameters' do
      before(:all) do
        @user = create(:user)
      end

      it 'Login with User' do
        post api_v1_sign_in_url,
             params: { email: @user.email, password: '123456' }, headers: valid_headers, as: :json
        expect(response).to have_http_status(200)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response.body).to include_json(
          message: 'Login efetuado com sucesso!',
          token: (be_kind_of String),
          user: {
            id: @user.id,
            email: @user.email,
            name: @user.name
          }
        )
      end

      it 'Login with invalid parameters' do
        post api_v1_sign_in_url,
             params: { email: @user.email, password: '' }, as: :json
        expect(response).to have_http_status(401)
        expect(response.body).to include_json(
          message: 'E-mail ou senha incorreta'
        )
        expect(response.content_type).to match(a_string_including('application/json'))
      end

      it 'Login without parameters' do
        post api_v1_sign_in_url,
             params: {}, as: :json
        expect(response).to have_http_status(404)
        expect(response.body).to include_json(
          message: 'E-mail ou senha não encontrados'
        )
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with valid parameters' do
      it 'register a new User' do
        expect do
          post api_v1_sign_up_url,
               params: { user: valid_attributes }, headers: valid_headers, as: :json
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the register new user' do
        post api_v1_sign_up_url,
             params: { user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response.body).to include_json(
          user: {
            id: (be_kind_of Integer),
            email: (be_kind_of String)

          }
        )
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post api_v1_sign_up_url,
               params: { user: invalid_attributes }, headers: valid_headers, as: :json
        end.to change(User, :count).by(0)
      end

      it 'renders a JSON response with errors for the new user' do
        post api_v1_sign_up_url,
             params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end

      it 'renders a JSON response with errors for the new user' do
        post api_v1_sign_up_url,
             params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end

      it 'renders a JSON response with errors for the bad request' do
        post api_v1_sign_up_url,
             params: {}, headers: valid_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response.body).to include_json(
          error: be_kind_of(String)
        )
      end
    end
  end
end
