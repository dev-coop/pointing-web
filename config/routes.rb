Rails.application.routes.draw do

  #
  # API Routes
  #
  # Rather than constraining to subdomain let's match domain beginning with 'api.' so that we
  # can access 'http://api.localhost:3000/' which is closer to the rails convention of using
  # http://localhost:3000.  To get is working you just need to add this to /etc/hosts:
  #   127.0.0.1   api.localhost

  # TODO: let api domain constraint be configurable
  constraints host: /^api\.*./ do
    namespace :api, path: '', defaults: { format: :json } do
      namespace :v1 do
        resources :locations
      end
    end
  end

  #
  # Web Admin Routes
  #

  namespace :admin do
    resources :locations
  end

  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout' }

  root to: "admin/dashboard#index"
end
