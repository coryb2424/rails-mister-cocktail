Rails.application.routes.draw do
  resources :cocktails, except: %i[update edit destroy] do
    resources :doses, only: %i[new create]
  end
  resources :doses, only: :destroy

  root "cocktails#index"
end
