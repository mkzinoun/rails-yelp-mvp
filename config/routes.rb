Rails.application.routes.draw do
  resources :restaurants, only: %i[index create show new] do
    resources :reviews, only: %i[index create]
  end
end
