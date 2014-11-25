Rails.application.routes.draw do
  get 'thanks/create'

  get 'thanks/destroy'

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :thanks, only: [:index, :show, :create, :destroy]
end
