Rails.application.routes.draw do
  devise_for :wizards
  devise_for :users
  root 'landing#home'
  get 'show', to: 'welcome#show', as: 'show_dash'
  put 'toggle', to: 'welcome#tog', as: 'toggle_button'

  get '/dash', to: 'wizard_dashboard#dash', as: 'dashboard'
  post '/dash', to: 'wizard_dashboard#claim'
  get 'number', to: 'wizard_dashboard#number'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
