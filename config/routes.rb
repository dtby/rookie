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

  # 注册完成时的问卷调查
  resources :searchs, only: [:new, :create]

  # 短信验证
  resources :messages, only: [:create]
  
  resources :votes, only: [:create]

  # 用户
  resources :users do
    #个人基础信息, 我的活动
    member do
      get 'personal'
      get 'explain'
      get 'feedback'
    end

    resources :educations

    resources :works
    
    resources :internships

    resources :subscriptions

    resources :signs, only: [:create]

    # 我的主页
    resources :attention do
      collection do
        get 'focus'
        get 'subscription'
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
  end

  # 所有的任务
  resources :tasks do
    # 任务包申请
    resources :applies

    collection do
      get 'personal_tasks'
      get :search_city
    end
    member do
      post :tag
      get :remove
    end
  end

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
    # 所有测试题
    resources :questions, except: [:show] do
      collection do
        get 'import'
        post 'import_create'
        delete 'clear'
      end
      # 测试题的所有选项
      resources :options, except: [:show]
    end

    # 用户
    resources :users

    # 调查问卷
    resources :searchs, only: [:index]
  end


  # 官方活动(公开课：courses、FaceBoss：meetings、特训营：trainings)
  # resources :courses, only: [:index]
  # resources :meetings, only: [:index]
  # resources :trainings, only: [:index]


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
