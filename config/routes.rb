Rails.application.routes.draw do
  
  root 'products#index'
  
  devise_for :users

  resources :static_pages, only: [:index], path: 'equipe'
  resources :kituis, only: [:index]

  resources :products, only: [:show, :index], path: 'articles'
  resources :categories, only: [:show], path: 'categorie'
  
  resources :users, only: [:show], path: 'utilisateur' do
    resources :carts, only: [:show], path: 'panier' do 
      resources :charges, only: [:new, :create], path: 'paiement'
    end
  end
  
  resources :product_carts, only: [:new, :create, :destroy], path: 'contenu-panier'
  
  
end
