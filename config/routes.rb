Rails.application.routes.draw do
  devise_for :admin_users
  devise_scope :admin_user do
    get 'admin', to: 'devise/sessions#new'
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :dashboard, only: :index
    resources :users, only: :index do\
      collection do
        get 'candidate_users'
      end
    end
  end
  resources :users, path: '', only: %I[show create]

end
