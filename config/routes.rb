Rails.application.routes.draw do
  root "items#index"

  devise_for :users

  resources :items do
    resources :item_purchases, only: [:index, :create, :new]
  end


end
