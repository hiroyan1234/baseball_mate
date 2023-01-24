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
    resources :player_posts, only: [:index, :show, :destroy]
    resources :team_posts, only: [:indes, :show, :destroy]
  end

  scope module: :public do
    get 'homes/top'
    get 'team_search' => 'team_posts#search'
    get 'player_search' => 'player_posts#search'
    get 'team_tag_search' => 'team_posts#tag_search'
    get 'player_tag_search' => 'player_posts#tag_search'
    get 'homes/about'
    get 'users/unsubscribe'
    patch "users/withdrawal"
    post "team_posts/new/view" => "team_posts#new", as:"team_posts_new"
    resources :teams
    resources :player_posts
    resources :players, only: [:index, :show]
    resources :users, only: [:edit, :update, :show]
    resources :messages, only: [:create]
    resources :rooms, only: [:index, :show, :create]
    resources :favorite_teams, only: [:index]
    resources :favorite_players, only: [:index]
    resources :team_posts, only: [:index, :edit, :update, :create, :destroy, :show]
    root to: "homes#top"
    resources :team_posts do
      resource :favorite_teams, only: [:create, :destroy]
    end
    resources :player_posts do
      resource :favorite_players, only: [:create, :destroy]
    end
  end
end
