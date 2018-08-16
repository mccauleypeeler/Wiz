Rails.application.routes.draw do
  devise_for :wizards
  devise_for :users
  root 'application#home'
  get 'show', to: 'welcome#show', as: 'show_dash'
  put 'active', to: 'welcome#tog_on', as: 'toggle_on'
  put 'inactive', to: 'welcome#tog_off', as: 'toggle_off'
  put 'user/disconnect', to: 'welcome#disconnect', as: 'user_disconnect'

  get '/dash', to: 'wizard_dashboard#dash', as: 'dashboard'
  post '/dash', to: 'wizard_dashboard#claim'
  put '/disconnect', to: 'wizard_dashboard#disconnect', as: 'disconnect'

  get 'number', to: 'wizard_dashboard#number'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
