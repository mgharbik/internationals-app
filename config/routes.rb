Rails.application.routes.draw do
  root 'internationals#index'
  match '*path', to: 'internationals#index', via: :all
end
