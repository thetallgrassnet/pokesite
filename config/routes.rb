Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :article, path: 'articles' do
    root 'posts#index'
    get '(page/:page)', controller: :posts, action: :index

    resources :columns, only: [] do
      get '(page/:page)', controller: :columns, action: :show, as: ''
    end

    resources :posts, only: :show
  end

  root 'welcome#index'
end
