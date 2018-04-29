Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :organizations
  resources :users
  resources :events
  resources :technologies
  resources :announcements

  namespace :admin do
    #if admin wants to create organization, go to the general create page
    resources :organizations, except: [:new, :create, :show]
    resources :users, only: [:index, :destroy]
    resources :events
    resources :technologies, except: [:show, :edit, :update]
    resources :announcements
  end

  get('/', { to: 'welcome#index', as: 'home' })
  get('/show', { to: 'welcome#show'} )

end
