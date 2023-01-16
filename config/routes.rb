Rails.application.routes.draw do


  # 顧客用
# URL /customers/sign_in ...
devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    namespace :admin do
    resources :users, only: [:index, :edit, :update, :show]
    resources :teams, only: [:index, :edit, :update, :show]
    resources :rooms, only: [:index, :show]
    get 'homes/top'
    resources :player_post, only: [:index, :show, :destroy]
    resources :team_post, only: [:indes, :show, :destroy]
  end

  scope module: :public do
    get 'homes/top'
    get 'homes/about'
    get 'users/unsubscribe'
    patch "users/withdrawal"
    post "team_post/new/view" => "team_post#new", as:"team_post_new"
    resources :teams
    resources :players, only: [:index, :show]
    resources :users, only: [:edit, :update, :show]
    resources :messages, only: [:create]
    resources :room, only: [:index, :show, :create]
    resources :favorite_teams, only: [:index]
    resources :favorite_players, only: [:index]
    resources :player_post
    resources :team_post, only: [:index, :edit, :update, :create, :destroy, :show]
    root to: "homes#top"
  end
end
