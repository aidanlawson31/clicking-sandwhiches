Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  resources :locations do
    member do
      get    'show_menus'
      post   'add_menus'
      delete 'remove_menu'
      post   'add_image'
      delete 'remove_image'
    end
  end

  resources :businesses
  resources :menus
  resources :categories
  resources :menu_items
end
