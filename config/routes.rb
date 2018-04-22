Rails.application.routes.draw do
  resources :articles, except: [:show]

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
