Rails.application.routes.draw do
  resources :contacts
  post '/contacts/:id/edit', to: 'contacts#edit'

  root 'contacts#index'
end
