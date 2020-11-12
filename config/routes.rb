Rails.application.routes.draw do

  devise_for :users
  root 'post_images#index'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    # favoritesのshowページが不要で、idの受け渡しも必要ないので、resourceとなっている
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
