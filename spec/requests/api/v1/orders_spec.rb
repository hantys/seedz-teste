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

RSpec.describe '/orders', type: :request do
  before(:all) do
    @user = create(:user)
  end

  let(:valid_attributes) do
    attributes_for(:order, product_id: create(:product).id, user_id: @user.id)
  end

  let(:invalid_attributes) do
    attributes_for(:order, product: nil, amount: nil)
  end

  let(:valid_headers) do
    return { Authorization: JsonWebToken.encode(user_token: @user.token), 'Content-Type': 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      create(:order)
      get api_v1_orders_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.body).to include_json(
        {	"orders": [] }
      )
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      order = create(:order)
      get api_v1_order_url(order), headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.body).to include_json(
        order: {
          id: order.id,
          amount: order.amount,
          total: order.total,
          user: {
            id: order.user.id,
            email: order.user.email,
            name: order.user.name
          },
          product: {
            id: order.product.id,
            name: order.product.name,
            stock: order.product.stock,
            price: order.product.price
          }
        }
      )
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Order' do
        expect do
          puts valid_attributes
          post api_v1_orders_url,
               params: { order: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Order, :count).by(1)
      end

      it 'renders a JSON response with the new order' do
        post api_v1_orders_url,
             params: { order: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Order' do
        expect do
          post api_v1_orders_url,
               params: { order: invalid_attributes }, headers: valid_headers, as: :json
        end.to change(Order, :count).by(0)
      end

      it 'renders a JSON response with errors for the new order' do
        post api_v1_orders_url,
             params: { order: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        attributes_for(:order, amount: 2)
      end

      it 'updates the requested order' do
        order = create(:order, amount: 1)
        patch api_v1_order_url(order),
              params: { order: new_attributes }, headers: valid_headers, as: :json
        order.reload
        expect(order.amount).to eq(2)
        expect(order.total).to eq((2 * order.product.price.round(2)))
        expect(response).to have_http_status(:ok)
        expect(response.body).to include_json(
          order: {
            id: order.id,
            amount: 2
          }
        )
      end

      it 'renders a JSON response with the order' do
        order = create(:order)
        patch api_v1_order_url(order),
              params: { order: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the order' do
        order = create(:order)
        patch api_v1_order_url(order),
              params: { order: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested order' do
      order = create(:order)
      expect do
        delete api_v1_order_url(order), headers: valid_headers, as: :json
      end.to change(Order, :count).by(-1)
    end
  end
end