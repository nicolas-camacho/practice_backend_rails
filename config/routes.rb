Rails.application.routes.draw do
  # get 'welcome/index'
  namespace :api do
    namespace :v1 do
      get 'user/genders', to: 'users#genders'
      post 'auth/login', to: 'user#login'
      resources :users, :headquarters, :phones, :purchases
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
