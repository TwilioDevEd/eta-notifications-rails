Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'main#index', as: 'home'

  post 'orders/:id/initial_notifications', to: 'orders#send_initial_notification', as: 'initial_notifications'
  post 'orders/:id/delivery_notifications', to: 'orders#send_delivery_notification', as: 'delivery_notifications'
  post 'orders/:id/status', to: 'orders#status', as: 'orders_status'
  resources :orders, only: [:index, :show]
end
