Rails.application.routes.draw do

  root 'static_pages#top'
  get '/signup', to: 'users#new'

  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :bases do
    member do
      get 'edit_system_info'
    end
  end

  resources :users do
    collection {post :import} #csvインポート用ルーティング
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month'
      get 'users_at_work'
    end
    resources :attendances, only: :update
  end
end