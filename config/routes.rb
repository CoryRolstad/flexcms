Rails.application.routes.draw do
  resources :contacts
  patch '/contacts/:id/edit', to: 'contacts#edit'
  delete '/phone_numbers/:id', to: 'phone_numbers#destroy', as: 'phone_number'
  post '/phone_numbers/new', to: 'phone_numbers#create', as: 'new_phone_number'
  get '/phone_numbers/new', to: 'phone_numbers#new'

  root 'contacts#index'
end
