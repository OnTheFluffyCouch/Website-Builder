Rails.application.routes.draw do
  root to: 'statics#index'
  get 'signup' => 'users#new'
end
