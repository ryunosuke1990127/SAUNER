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
    resources :saunas do
      get '/create_check' => 'saunas#create_cheak'
    end
    resources :regions,only:[:create,:index]
    resources :reviews,only:[:new,:create,:show]
    post 'reviews/comment_create' => 'reviews#comment_create'


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
    resources :reviews,only:[:index,:show,:destroy]
  end
end
