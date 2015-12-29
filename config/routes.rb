Rails.application.routes.draw do
  root to: 'statics#index'
  get 'about' => 'statics#about'
  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources 'users'
end
