Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :organizations
  post('/organizations/show', { to: 'users#claim_request', as: 'claim_request' })

  resources :users
  resources :events
  resources :technologies
  resources :announcements

  namespace :admin do
    #if admin wants to create organization, go to the general create page
    resources :organizations, only: [:index]
    resources :users
    resources :events
    resources :technologies, except: [:show, :edit, :update]
    resources :announcements
  end

  post('/images/:organization_id', { to: 'images#create', as: 'images' })
  
  get('/', { to: 'welcome#index', as: 'home' })
  get('/show', { to: 'welcome#show'} )

end
