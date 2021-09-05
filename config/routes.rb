Rails.application.routes.draw do
  resources :contacts
  patch '/contacts/:id/edit', to: 'contacts#edit'

  root 'contacts#index'
end
