Rails.application.routes.draw do
  devise_for :users
  resources  :businesses

  resources :locations do
    member do
      get    'show_menus'
      post   'add_menus'
      post   'add_image'
      delete 'remove_menu'
      delete 'remove_image'
    end
  end

  resources :menus do
    member do
      get   'sort_menu_categories'
      patch 'save_sort_menu_categories'
    end

    resources :categories do
      member do
        get   'sort_category_menu_items'
        patch 'save_sort_category_menu_items'
      end

      resources :menu_items
    end
  end

  get ':business_url',                         to: 'public_locations#index', as: :public_locations
  get ':business_url/:location_url',           to: 'public_locations#show',  as: :public_location
  get ':business_url/:location_url/:menu_url', to: 'public_menus#show',      as: :public_menu
end
