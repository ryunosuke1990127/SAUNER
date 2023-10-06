Rails.application.routes.draw do
devise_for :members,skip: [:passwords],  controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_scope :member do
    post 'public/members/guest_sign_in', to:  'public/sessions#guest_sign_in'
end

devise_for :admin, skip: [:registrations, :passwords],  controllers: {
  sessions: "admin/sessions"
}

scope module: :public do
  root to: 'homes#top'
end



end
