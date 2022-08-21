Rails.application.routes.draw do
  
  # トップページ
  root 'static_pages#top'

  get 'todos', to: 'site#index'
  get 'todos/new', to: 'site#index'
  get 'todos/:id/edit', to: 'site#index'
  
  namespace :api do
    namespace :v1 do
      delete '/todos/destroy_all', to: 'todos#destroy_all'
      resources :todos, only: %i[index show create update destroy]
    end
  end
  
  # ユーザー登録ページ
  get '/signup', to: 'users#new'
  
  # ログイン機能
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  # ユーザー
  resources :users
  
  # # 漁場
  # resources :grounds do
  
  #   member do
  #     get 'landing_show', to: 'landings#show'
  #     delete 'landing_destroy', to: 'landings#destroy'
  #   end
  #   # 水揚げ
  #   resources :landings, only: [:new, :create, :edit, :update]
  
  # end
  
  # get 'landing_index', to: 'landings#index'
  # get 'landing_pre_new', to: 'landings#pre_new'
  
  # 帳簿（売上帳）
  resources :accounts do
    
    member do
      # 帳簿（振替伝票）
      get 'transfer_slip_edit'
      patch 'transfer_slip_update'
      delete 'transfer_slip_destroy'
    end
    
    collection do
      # 帳簿（振替伝票）
      get 'transfer_slip_new'
      post 'transfer_slip_create'

      # レシートOCR
      get 'ocr_new'
      post 'ocr_create'
      
      # 仕訳帳
      get 'journal_books'
      get 'csv_journal_books'
      # 総勘定元帳
      get 'all_general_ledger'
      get 'master_general_ledger'
      get 'sub_master_general_ledger'
      # csv出力
      get 'csv'
      
      # 貸借対照表
      get 'balance_sheet'
      # 損益計算書
      get 'profit_and_loss_statement'
      
    end
    
  end
  
end