Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  get 'welcome/index'
  get 'sessions/new'
  get 'users/new'

  resources :feedbacks, only: %w[new create]

  resources :tests, only: :index do
    post :start, on: :member
  end

  # GET /test_passages/38/result
  resources :test_passages, only: %w[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :badges
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: [:index] do
        resources :answers, shallow: true, except: [:index]
      end
    end
    resources :gists, only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
