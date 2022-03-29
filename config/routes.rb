Rails.application.routes.draw do
  # purpose: told devise to use the own customize controller
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :stories

  # /@username/article_title
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'
  # /@username
  get '@:username', to: 'pages#user', as: 'user_page'

  # demo purpose for stimulus 1.17
  get '/demo', to: 'pages#demo'

  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
