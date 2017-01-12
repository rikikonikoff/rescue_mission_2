Rails.application.routes.draw do
  root "questions#index"

  resources :users, only: [:index, :new, :create] do
    resources :questions, only: [:index]
  end

  resources :questions do
    resources :answers, except: [:index, :show]
  end
end
