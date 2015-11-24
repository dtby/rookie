Rails.application.routes.draw do
  devise_for :users
  mount WeixinRailsMiddleware::Engine, at: "/"

  root 'welcome#index'

  resources :messages, only: [:create]
  resources :tasks

  resources :personal
  resources :pages, only: [:index, :show]

  resources :attention do
    collection do
      get 'focus'
      get 'subscription'
      get 'feedback'
      get 'interest'
    end
  end

  # 官方活动(公开课：courses、FaceBoss：meetings、特训营：trainings)
  resources :courses
  resources :meetings
  resources :trainings

  # 活动
  resources :activities do
    collection do
      get 'my'
      get 'official'
      get 'else'
      get 'apply'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
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
