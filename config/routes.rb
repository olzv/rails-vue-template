Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root controller: :landing, action: :index

  namespace :api do
    resources :users
  end

  get '*path', controller: :landing, action: :index
end
