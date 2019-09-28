Rails.application.routes.draw do

  get 'welcome/index'
  get 'sessions/new'
  get 'users/new'

  root 'welcome#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
