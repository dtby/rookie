Rails.application.routes.draw do
  mount WeixinRailsMiddleware::Engine, at: "/"
  mount ChinaCity::Engine => '/china_city'

  # 前台用户登录
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  # 网站主页
  root 'tests#new'

  # 短信验证
  resources :messages, only: [:create]
  resources :votes, only: [:create]
  # 任务包申请
  resources :applies do
    member do
      post :deal
    end
  end

  # 用户
  resources :users do

    resources :educations

    resources :works
    
    resources :internships

    # 我的主页
    resources :attention do
      collection do
        get 'focus'
        get 'subscription'
        get 'feedback'
        get 'interest'
      end
    end

    # 我的主页
    resources :pages, only: [:index] do
      collection do
        get 'resume'
        get 'info'
      end
    end

    #个人基础信息
    member do
      get 'personal'
    end
  end

  # 任务
  resources :tasks do
    collection do
      get 'personal_tasks'
    end
    member do
      post :tag
      get :remove
    end
  end

  # 官方活动(公开课：courses、FaceBoss：meetings、特训营：trainings)
  resources :courses
  resources :meetings
  resources :trainings

  # 测试模块
  resources :tests do
    collection do
      get 'result'
      get 'next'
    end
  end

  # 活动
  resources :activities do
    collection do
      get 'my'
      get 'official'
      get 'else'
    end
  end

  #后台管理
  namespace :admin do
    root 'home#index'
    # 所有问题
    resources :questions, except: [:show] do
      collection do
        get 'import'
        post 'import_create'
        delete 'clear'
      end
      # 问题的所有选项
      resources :options, except: [:show] do
        collection do
          post 'uploads'
        end
      end
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
