Rails.application.routes.draw do

  get 'users', to: 'users#index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords'
      }
  root 'static_pages#home'

  get    '/about',   to: 'static_pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
