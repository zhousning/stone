Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  devise_scope :user do
    get 'forget', to: 'users/passwords#forget'
    patch 'update_password', to: 'users/passwords#update_password'
    post '/login_validate', to: 'users/sessions#user_validate'
  end

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :properties do
  end
  resources :nests do
  end
  resources :domains do
  end
  resources :majors do
  end
  resources :domains do
  end

  resources :labours, :only => [:edit, :update] do
    resources :labour_handles do
    end
    resources :labour_teches do
    end
    resources :labour_lines do
    end
    resources :labour_workers do
    end
    resources :projects do
      get :download_append, :on => :member
      get :project_table, :on => :member
      put :create_table, :on => :member
    end
  end
  resources :labour_handles do
    resources :handle_certs do
    end
  end
  resources :labour_teches do
    resources :tech_certs do
    end
  end
  resources :labour_lines do
    resources :line_certs do
    end
  end
  resources :labour_workers do
    resources :worker_certs do
    end
  end

  resources :supervisors, :only => [:edit, :update] do
    resources :supervisor_states do
    end
    resources :supervisor_targets do
    end
    resources :supervisor_workers do
    end
  end
  resources :designers, :only => [:edit, :update] do
    resources :designer_structures do
    end
    resources :designer_constructors do
    end
    resources :designer_waters do
    end
    resources :designer_electrics do
    end
    resources :designer_warms do
    end
    resources :designer_posts do
    end
  end

  resources :agentor_cos, :only => [:edit, :update] do
    resources :agentor_handles do
    end
  end
  resources :monitor_cos, :only => [:edit, :update] do
    resources :monitor_handles do
    end
  end
  resources :constructors, :only => [:edit, :update] do
    resources :constructor_handles do
    end
  end
  resources :prospectors, :only => [:edit, :update] do
    resources :prospector_handles do
    end
  end

  resources :table_templates do
    get :download_append, :on => :member
  end
  resources :table_pages do
    get :download_append, :on => :member
  end
  resources :table_pages do
    get :download_append, :on => :member
  end
  resources :projects, :only => [] do
    get :create_my_table, :on => :member
    resources :project_tables do
      get :download_append, :on => :member
    end
  end
  resources :project_tables do
    get :download_append, :on => :member
  end
  resources :project_pages do
    get :download_append, :on => :member
  end
  resources :cert_ctgs do
  end

  resources :designer_constructor, :only => [] do
    resources :designer_constructor_certs do
    end
  end
  resources :designer_structure, :only => [] do
    resources :designer_structure_certs do
    end
  end
  resources :designer_post, :only => [] do
    resources :designer_post_certs do
    end
  end
  resources :designer_water, :only => [] do
    resources :designer_water_certs do
    end
  end
  resources :designer_electric, :only => [] do
    resources :designer_electric_certs do
    end
  end
  resources :designer_warm, :only => [] do
    resources :designer_warm_certs do
    end
  end

  resources :supervisor_state, :only => [] do
    resources :supervisor_state_certs do
    end
  end
  resources :supervisor_target, :only => [] do
    resources :supervisor_target_certs do
    end
  end
  resources :supervisor_worker, :only => [] do
    resources :supervisor_worker_certs do
    end
  end
  resources :flower

  resources :controls, :only => [:index]
  resources :templates do
    get :produce, :on => :member
  end

  resources :nlps do
    collection do
      post 'analyze'
    end
  end

  resources :notices
  resources :articles do
    get :export, :on => :collection
    get :main_image, :on => :member
    get :detail_image, :on => :member
  end

  resources :websites do
    resources :documents do
      get :check, :on => :member
      get :download, :on => :member
      get :preview, :on => :member
    end
    resources :pages do
      get :set_parent, :on => :collection
    end
    get :export, :on => :member
  end

  resources :newsites do
    get :draft_navbar, :on => :member
    get :draft_edit, :on => :member
    put :draft_update, :on => :member
    patch :draft_update, :on => :member
    get :produce, :on => :member
    get :prepare, :on => :member
  end

  resources :ocrs do
    post :analyze, :on => :collection
  end

  resources :subunits

  resources :statistics, :only => [:index] do
    get :line, :on => :collection
    get :series, :on => :collection
    get :column, :on => :collection
    get :pie, :on => :collection
    get :bar, :on => :collection
    get :area, :on => :collection
    get :scatter, :on => :collection
  end

  resources :systems, :only => [] do
    get :send_confirm_code, :on => :collection
  end

  resources :users, :only => []  do
    get :center, :on => :collection
    get :alipay_return, :on => :collection
    post :alipay_notify, :on => :collection
    get :mobile_authc_new, :on => :member
    post :mobile_authc_create, :on => :member
    get :mobile_authc_status, :on => :member
  end

  resources :orders, :only => [:new, :create] do
    get :pay, :on => :collection
    get :alipay_return, :on => :collection
    post :alipay_notify, :on => :collection
  end

  resources :tasks, :only => [] do
    get :invite, :on => :collection
  end

  resources :accounts, :only => [:edit, :update] do
    get :recharge, :on => :collection 
    get :info, :on => :collection
    get :status, :on => :collection
  end

  resources :roles

  resources :spiders do
    get :start, :on => :member
  end
  resources :selectors

  root :to => 'home#index'
end
