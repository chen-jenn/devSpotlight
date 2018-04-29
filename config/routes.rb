Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :organizations
  resources :users
  resources :events
  resources :technologies
  resources :announcements

  namespace :admin do
    resources :organizations, only: [:index]
    resources :users, except: [:new, :create]
    resources :events, only: [:index, :destroy, :edit]
    resources :technologies, except: [:show]
    resources :announcements
  end

  get('/', { to: 'welcome#index', as: 'home' })
  get('/about', { to: 'welcome#show'} )

end
