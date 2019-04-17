Rails.application.routes.draw do
  get 'feed' => 'epicenter#feed'

  get 'epicenter/show_user'

  get 'unfollow' => 'epicenter#unfollow'

  get 'epicenter/unfollow'

  get 'show_user' => 'epicenter#show_user'

  get 'follow' => 'epicenter#unfollow'

  get 'now_following' => 'epicenter#now_following'

  get 'tweets' => 'tweets#index'

  get 'tag_tweets' => 'epicenter#tag_tweets'

  get 'all_users' => 'epicenter#all_users'

  get 'followers' => 'epicenter#followers'

  get 'following' => 'epicenter#following'

  resources :tweets
  devise_for :users
  
  root 'tweets#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
