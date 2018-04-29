Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :organizations
  resources :users
  resources :events
  resources :technologies
  resources :announcements

  namespace :admin do
    resources :organizations, only: [:index, :edit, :create, :destroy]
    resources :users
    resources :organizations
    resources :users, only: [:index, :destroy]
    resources :events
    resources :technologies
    resources :announcements
  end

  get('/', { to: 'welcome#index', as: 'home' })
  get('/show', { to: 'welcome#show'} )

end
