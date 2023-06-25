Rails.application.routes.draw do
  resources :workers
  resources :shifts

  root to: 'workers#index'

  get '/workers/:id/delete', to: 'workers#delete_worker', as: 'delete_worker'

end