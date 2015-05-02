Rails.application.routes.draw do
  namespace :admin do
    resources :locations
  end
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout' }
  root to: "admin/dashboard#index"
end
