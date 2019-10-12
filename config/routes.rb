Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :internationals, only: %i[index]
    end
  end

  root 'pages#index'
  match '*path', to: 'pages#index', via: :all
end
