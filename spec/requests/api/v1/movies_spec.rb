require 'rails_helper'

RSpec.describe "movies controller", type: :request do

    it 'return a list of movies' do
        movies = FactoryBot.create_list(:movie, 5)

        get '/api/v1/movies'
        
        expect(response.content_type).to eq('application/json') 
        expect(json[:data].size).to eq(movies.size)  
    end

    it 'create a movie with valid authorization' do
        user = create(:user)
        person = create(:person)
        user_params = {
            user: {
                email: user.email,
                password: user.password
            }
        }
        movie_params = {
            movie: {
                title: 'MOCK_TITLE',
                release_year: 2019,
                people_roles: [
                    { person_id: person.id, role: 'actor' }
                ]
            }
        }
        post '/login', params: user_params

        expect(response).to have_http_status(200)
        expect(response.headers['Authorization']).to be_present

        auth_token = response.headers['Authorization']
        headers = { 'AUTHORIZATION' => auth_token, 'CONTENT_TYPE' => 'application/json' }
        
        post '/api/v1/movies', params: movie_params.to_json, headers: headers
        
        expect(response).to have_http_status(:created)
        puts json[:data]
        expect(json[:data][:attributes][:title]).to eq(movie_params[:movie][:title])

    end
end
