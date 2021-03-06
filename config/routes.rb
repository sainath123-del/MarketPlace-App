Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/purchases/success', to: 'purchases#success'

  resources :products
  root 'products#index'
end
