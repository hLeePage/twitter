Rails.application.routes.draw do
  use_doorkeeper

  root 'tweets#index'
  
  resources :tweets, except: [:new, :edit, :destroy]
  resources :users, except: [:new, :edit] do
    put :follow
    put :unfollow
    collection do
      post :login
    end
  end
end
