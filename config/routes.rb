require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    mount Sidekiq::Web => '/sidekiq'
devise_for :users
resources :items do
  member do
    patch :complete
  end
end

root 'items#index'

end
