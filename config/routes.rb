Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  #devise を使用する際に URL として users を含むことを示している

  resources :post_images, only:[:new, :create, :index, :show, :destroy]do
    resources :post_comments,only:[:create, :destroy]
  end
  # get 'postimages/new'
  # get 'postimages/index'
  # get 'postimages/show'
  resources :users, only:[:show, :edit, :update]
  #get 'users/show'
  #get 'users/edit'



  get 'homes/about' => 'homes#about' ,as: 'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
