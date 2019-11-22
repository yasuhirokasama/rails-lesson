Rails.application.routes.draw do
  get 'posts/index' => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  # new.htmlの送信ボタンが押された時
  post "posts/create" => "posts#create"
  # show.htmlの編集ボタンが押された時
  get "posts/:id/edit" => "posts#edit"
  # edit.htmlの保存ボタンが押された時
  post "posts/:id/update" => "posts#update"
  # show.htmlの削除ボタンが押された時
  post "posts/:id/destroy" => "posts#destroy"

  get "/" => "home#top"
  get "about" => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
