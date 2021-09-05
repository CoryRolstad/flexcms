Rails.application.routes.draw do
  resources :contacts
  patch '/contacts/:id/edit', to: 'contacts#edit'
  delete '/phone_numbers/:id', to: 'phone_numbers#destroy', as: 'phone_number'

  root 'contacts#index'
end
