Spree::Core::Engine.routes.draw do
  # Add your extension routes here
   namespace :admin do
    resources :mega_menus do 
      resources :mega_menu_items
    end
  end
end
