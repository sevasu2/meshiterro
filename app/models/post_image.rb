class PostImage < ApplicationRecord
	belongs_to :user
	attachment :image # ここを追加（_idは含めません）
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	 def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
          # このメソッドで、引数で渡されたユーザのidがFavoritesテーブル内に存在（exists?）しているかを調べます。
          # 存在していればTrue、存在していなければFalseを返すようにしています。
     end

end
