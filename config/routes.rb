Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :internationals, only: %i[index show create]
      resources :friendships, only: %i[create]
    end
  end

  root 'pages#index'
  match '*path', to: 'pages#index', via: :all
end
