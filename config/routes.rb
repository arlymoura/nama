Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard/new_import'
  post 'dashboard/import'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :dashboard do
  #   collection do
  #      # import_new_file_path
  #     get 'dashboard/new', to: :new_import

  #     # import_file_path
  #     post :dashboard_import
  #   end
  # end
  root 'dashboard#index'
end
