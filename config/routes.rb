Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#show'

  get '/reservations', to: 'reservations#index'

  get '/expenses', to: 'expenses#index'

  get '/leases', to: 'leases#index'
  get '/leases/:id', to: 'leases#show'

end
