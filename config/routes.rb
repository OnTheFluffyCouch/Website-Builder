Rails.application.routes.draw do
  resources :artworks
  resources :blogs do
    resources :comments, :only => :create
  end

  get 'login' => 'user_session#new'
  post 'login' => 'user_session#create'
  delete 'login' => 'user_session#destroy'
  root 'blogs#index'
end
