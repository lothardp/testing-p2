Rails.application.routes.draw do
  root 'flights#index'

  get '/flights', to: 'flights#index', as: 'flights'
  get '/flights/:id', to: 'flights#show', as: 'flight' # equivale al new reservation
  post '/flights/:id/reservations', to: 'reservations#create', as: 'reservations' # equivale al new reservation

  get 'admin/flights', to: 'admin/flights#index', as: 'admin_flights'
  get 'admin/flights/new', to: 'admin/flights#new', as: 'new_flight'
  get 'admin/reservations', to: 'admin/reservations#index', as: 'admin_reservations'
  get 'admin/reservations/:id/edit', to: 'admin/reservations#edit', as: 'edit_admin_reservation'
  patch 'admin/reservations/:id', to: 'admin/reservations#update', as: 'admin_reservation'
  delete 'admin/reservations/:id', to: 'admin/reservations#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
