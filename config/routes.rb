Rails.application.routes.draw do
  devise_for :users
  #devise を使用する際に URL として users を含むことを示している
  root to: 'homes#top'
  get 'homes/about' => 'homes#about' ,as: 'about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
