require 'rails_helper'

RSpec.describe Api::V1::InternationalsController, type: :controller do
  let(:json_response) { JSON.parse(response.body) }

  describe "POST #create" do
    let(:params) do
      {
        international: {
          name: Faker::Name.name,
          country: Faker::Address.country,
        }
      }
    end

    before { post :create, params: params }

    it { expect(response).to have_http_status(:success) }
    it { expect(json_response['slug']).to be_present }

    context 'when invalid data' do
      let(:params) do
        {
          international: {
            name: Faker::Name.name,
            country: '',
          }
        }
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end
end
