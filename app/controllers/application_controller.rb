class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	# before_actionで指定されたメソッドはこのコントローラが実行される前に実行されます。
 	#  今回の場合、app/controllers/application_controller.rbに記述したので、
 	#  全てのコントローラで、最初にこのアクションメソッドが実行

	before_action :configure_permitted_parameters, if: :devise_controller?
	# deviseを利用する機能（ユーザ登録、ログイン認証など）が実行される前に、configure_permitted_parametersが実行されます。

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # configure_permitted_parametersでは、
  # devise_parameter_sanitizer.permitで
  # nameのデータ操作を許可するアクションメソッドが指定されています。
  # 今回の場合、ユーザ登録(sign_up)の際、ユーザ名(name)のデータ操作が許可されることになります。
end
