Rails.application.routes.draw do

  root 'welcome#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  get 'welcome/index'
  get 'sessions/new'
  get 'users/new'

  resources :tests, only: :index do
    resources :questions, shallow: true, except: [:index] do
      resources :answers, shallow: true, except: [:index]
    end

    post :start, on: :member
  end

  # GET /test_passages/38/result
  resources :test_passages, only: %w[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
