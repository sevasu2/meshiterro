class PostImagesController < ApplicationController

	def new
		@post_image = PostImage.new
	end

	# 投稿データの保存
	def create
		@post_image = PostImage.new(post_image_params)
		@post_image.user_id = current_user.id
		if @post_image.save
			redirect_to post_images_path
		  # redirect_to：HTTPリクエストを送るため、ルーティングから処理が行われます。
		else
			render :new
			# render：他のビューを呼び出す。
			# ※通常、呼び出されるビューは呼び出し元のコントローラ名とアクション名で決まるが、
			# renderを使うことで他のビューが呼び出せます。
			# この際、呼び出し先でインスタンス変数が使われていると、
			# 呼び出し元で定義されていなければエラーになるので注意が必要です。
		end
	end

	def index
		# @post_images = PostImage.all
		@post_images = PostImage.page(params[:page]).reverse_order
		 # これを1ページ分の決められた数のデータを新しい順に取得するように変更
		end

		def show
			@post_image = PostImage.find(params[:id])
			@post_comment = PostComment.new
		end

		def destroy
			@post_image = PostImage.find(params[:id])
			@post_image.destroy
			redirect_to post_images_path
			# @post_image = PostImage.find(params[:id])の部分では先に作成した
			# resourcesルーティングのdestroyで
			# 渡ってきたパラメータ(params[:id])を元に、削除するデータをfindメソッドを使って探して
			# @post_imageインスタンスに渡しています。
			# @post_image.destroyでは、
			# @post_imageインスタンスで渡されたデータをdestroyメソッドで削除します。
			# 最後にindexページへのredirect_toを記述して、アクションは完成です。
		end

	# 投稿データのストロングパラメータ
	private
	def post_image_params
		params.require(:post_image).permit(
			:shop_name,
			:image,
			:caption
			)
	end
end
