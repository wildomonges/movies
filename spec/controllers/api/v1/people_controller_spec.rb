# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PeopleController, type: :controller do
  # initialize test data
  let!(:people) { create_list(:person, 10) }
  let(:person_id) { people.first.id.to_s }
  # valid payload
  let(:valid_attributes) do
    {
      person: {
        first_name: 'MOCK_FIRST_NAME',
        last_name: 'MOCK_LAST_NAME',
        gender: :male
      }
    }
  end
  # invalid payload
  let(:invalid_attributes) do
    {
      person: {
        first_name: 'MOCK_FIRST_NAME',
        last_name: 'MOCK_LAST_NAME',
        gender: :animal
      }
    }
  end
  describe 'GET /people' do
    let(:search_attributes) do
      {
        q: {
          first_name_cont: '',
          last_name_cont: '',
          gender_eq: ''
        },
        page: 1,
        per_page: 10
      }
    end
    # make HTTP get request before each example
    before { get :index, params: search_attributes }

    it 'returns people' do
      expect(json).not_to be_empty
      expect(JSON.parse(response.body)['data'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /people/:id' do
    before { get :show, params: { id: person_id } }

    context ' when person exists' do
      it 'returns person' do
        expect(json).not_to be_empty
        expect(json['data']['id']).to eq(person_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:person_id) { 50 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /people' do
    context 'when the request is valid' do
      before { post :create, params: valid_attributes }

      it 'creates a person' do
        expect(json['data']['attributes']['last_name']).to eq('MOCK_LAST_NAME')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is not valid' do
      before { post :create, params: invalid_attributes }

      it 'creates a person' do
        expect(json['success']).to be false
      end
    end
  end

  describe 'PUT /people/:id' do
    let(:valid_attributes) do
      {
        id: '1',
        person:
        {
          first_name: 'MOCK_FIRST_NAME'
        }
      }
    end

    context 'when the record was updated' do
      before { put :update, params: valid_attributes }

      it 'updates a person' do
        expect(json['success']).to be true
      end
    end
  end

  describe 'DELETE /people/:id' do
    let(:valid_attributes) { { id: '1' } }

    context 'when the record was deleted' do
      before { delete :destroy, params: valid_attributes }

      it 'deletes a person' do
        expect(json['success']).to be true
      end
    end
  end
end
