Rails.application.routes.draw do
  root "items#index"

  devise_for :users

  resources :items do
    resources :item_purchases, only: [:index, :create, :new] do
      collection do
        get 'done'
      end
    end
  end

end
