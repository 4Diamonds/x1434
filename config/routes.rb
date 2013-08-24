Liker::Application.routes.draw do


  root to: 'user#index'
  devise_for :users

  namespace :user do
    resources :accounts, :pages, only: [:index]
    resources :invitations, only: [:index, :new, :create]
    resources :withdraws, only: [:index, :new, :create]
    resources :rewards, only: [:index, :new, :create]
    resources :pages, except: [:destroy] do
      get 'fblike',  on: :collection
      get 'fbshare', on: :collection
    end
    
    resources :orders, only: [:index, :new, :create] do
      member {get 'payment'}
    end

    resources :clicks, only: [:index] do
      member {get 'page'}
    end
    
    resources :categories, only: [:show], path: 'category'
  end

  resources :invitations, only: [:show] do
    put 'accept'
  end

  get 'user', to: 'user#index', as: 'user'
  get "termos-de-uso", to: "site#terms", as: :terms
  get "politica-de-privacidade", to: "site#privacy", as: :privacy
  get "sobre-empresa", to: "site#about", as: :about
  get "faq", to: "site#faq", as: :faq

  namespace :admin do
    resources :clicks, :balances, :rewards
    
    resources :pages do
      member {get 'page_activate'}
      member {get 'page_desactivate'}
    end

    resources :categories do
      member {get 'category_activate'}
      member {get 'category_desactivate'}
    end

    resources :packages do
      member {get 'package_activate'}
      member {get 'package_desactivate'}
    end

    resources :users do
      member {get 'user_activate'}
      member {get 'user_desactivate'}
    end

    resources :withdraws do
      member {get 'pay_withdraw'}
      member {get 'unpay_withdraw'}
    end 

    resources :orders do
      member {get 'pay_order'}
      member {get 'unpay_order'}
    end 
  end

  
  get 'admin', to: 'admin#index'
end