# 現場Railsアウトプット各種設計
​
### ER図
https://app.lucidchart.com/invitations/accept/af591cdb-20fd-4c94-9d2b-2f96b0292e70
​
### エンドポイント表
​

|HTTP verb|URL|Controller#Action|機能名|
|:----|:----|:----|:----|
|get|/foods|foods/index|食事一覧機能|
|get|/foods/new|foods/new|食事作成入力機能|
|get|/foods/id|foods#show|食事詳細機能|
|post|/foods|foods#create|食事作成機能|
|get|/foods/id/edit|foods#edit|食事更新入力機能|
|patch|/foods/id|foods#update|食事更新機能|
|delete|/foods/id|foods#destroy|食事削除機能|
|get|admin/users|admin/users#index|ユーザー一覧機能|
|get|admin/users/new|admin/users#new|ユーザー作成入力機能|
|post|admin/users|admin/users#create|ユーザー作成機能|
|delete|admin/users/id|admin/users#destroy|ユーザー削除機能|
|get|/profile|profiles#show|ログインユーザープロフィール表示機能|
|get|/profile/edit|profiles#edit|ログインユーザープロフィール更新入力機能|
|patch|/profile|profiles#update|ログインユーザープロフィール更新機能|
|post|foods/food_id/comment|comments#create|コメント作成機能|
|get|/comment/id/edit|comments#edit|コメント更新入力機能|
|patch|/comment/id|comments#update|コメント更新機能|
|delete|/comment/id|comments#destroy|コメント削除機能|
|get|/login|sessions#new|ログイン情報入力機能|
|post|/login|sessions#create|ログイン情報認証機能|
|delete|/logout|sessions#destroy|ログアウト機能|

​
・コメント機能に関しては、shallowオプションを指定するためネストはなし  
・foodテーブルのimageカラムはActiveStorageを使用予定