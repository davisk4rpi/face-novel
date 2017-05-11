Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: {
        #sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords'
      }, skip: [:sessions]

  as :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    post 'sign_in', to: 'devise/sessions#create', as: :user_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :users, only: [:show, :index]
  resources :friendships, only: [:create, :update, :destroy]

  get    '/about',   to: 'static_pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
