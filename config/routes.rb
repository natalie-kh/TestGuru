Rails.application.routes.draw do

  root 'tests#index'

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
