Rails.application.routes.draw do
  post 'static_pages/thank_you'

  resources :orders, only: [:index, :show, :create, :destroy]

  resources :products

  get '/about', to: 'static_pages#about'

  get '/contact', to: 'static_pages#contact'

  get '/caroussel', to: 'static_pages#landing_page'

  root 'static_pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
