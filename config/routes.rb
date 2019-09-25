Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, except: [:index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
