Ruby 2.5.1
Rails 5.2.2
sqlite3 1.3.6

実装した機能
・投稿機能
・投稿詳細
・コメント投稿機能
・コメント削除機能
・いいね機能
・新規登録機能
・ログイン機能
・マイページ機能
・プロフィール編集機能


テーブル設計

User
　id:integer
  name:text
  email:text
  password:string
  
PostImage
  id:integer
  shop_name:text
  caption:text
  image_id:integer
  user_id:integer

PostComment
  id:integer
  comment:text
  user_id:integer
  post_image_id:integer
  
Favorite
  id:integer
  user_id:integer
  post_image_id:integer
  
