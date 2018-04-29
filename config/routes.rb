Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :organizations
  resources :users
  resources :events
  resources :technologies
  resources :announcements

  namespace :admin do
    resources :organizations
    resources :users, only: [:index, :destroy]
    resources :events
    resources :technologies, except: [:show, :edit, :update]
    resources :announcements
  end

  get('/', { to: 'welcome#index', as: 'home' })
  get('/about', { to: 'welcome#about'} )

end
