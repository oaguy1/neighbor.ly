Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users, defaults: { format: :json }, controllers: {
        sessions:       'api/v1/users/sessions',
        registrations:  'api/v1/users/registrations',
        confirmations:  'api/v1/users/confirmations'
      }

      resources :users, :favors
    end
  end
end
