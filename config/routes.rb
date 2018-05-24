Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :articles, only: [:index, :show] do
    collection do
      get 'search'
      get :autocomplete
    end
  end

  get 'tags/:tag', to: 'articles#index', as: :tag

  get 'tags', to: "tags#index"

  root to: 'pages#home'
end
