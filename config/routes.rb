Rails.application.routes.draw do
  resources :trips, param: :token, except: [:new, :edit, :update] do
    member do
      post 'transition'
    end
  end


  root to: 'trips#index'
end
