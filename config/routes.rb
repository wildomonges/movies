Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :people
      resources :movies
    end
  end
end
