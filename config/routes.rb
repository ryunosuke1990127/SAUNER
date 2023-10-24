Rails.application.routes.draw do

  devise_for :members, skip: [:passwords],  controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords],  controllers: {
    sessions: "admin/sessions"
  }

  # ゲストログイン用の設定
  devise_scope :members do
      post 'member/guest_sign_in', to:  'public/sessions#guest_sign_in'
  end

  # ユーザー側の設定
  scope module: :public do
    root to: 'homes#top'
    get '/saunas/complete' => 'saunas#complete'
    post '/reviews/comment_create' => 'reviews#comment_create'
    get '/regions/region_sauna' => 'regions#region_sauna'
    post '/tags/search' => 'tags#search'

    resources :saunas do
      get '/create_check' => 'saunas#create_cheak'
      resource :favorites,only:[:create,:destroy]
    end

    resources :mypage,only: [:show] do
      get '/favorite' => 'mypage#favorite'
    end

    resources :regions,only:[:index]
    resources :reviews,only:[:new,:create,:show]
    resources :searchs,only:[:new,:create]
    resources :tags,only:[:index]
  end

  # 管理者側の設定
   namespace :admin do
     get '/posts/deny' =>'posts#deny'
     get '/posts/complete' =>'posts#complete'
     get '/reviews/member_index/:id' => 'reviews#member_index'
    resources :posts
    resources :members  do
       patch  '/withdraw' =>'members#withdraw'
    end
    resources :reviews do
      get '/confirm' => 'reviews#confirm'
    end

  end
end
