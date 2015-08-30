Rails.application.routes.draw do
  resources :games
  resources :players
  resources :tags
  resources :modifier_instances
  resources :modifiers
  resources :spaces
  resources :geographies
  resources :helpers
  resources :quests

  get 'games/discard_helper/:id/:helper_id/:player_id' => 'games#discard_helper', as: :discard_helper
  post 'games/draw_helper' => 'games#draw_helper'
  get 'games/discard_quest/:id/:quest_id/:player_id' => 'games#discard_quest', as: :discard_quest
  post 'games/draw_quest' => 'games#draw_quest'
  get 'games/start/:id' => 'games#start', as: :start_game
  post 'games/add_player' => 'games#add_player'
  post 'helpers/add_modifier' => 'helpers#add_modifier'
  post 'quests/add_modifier' => 'quests#add_modifier'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
