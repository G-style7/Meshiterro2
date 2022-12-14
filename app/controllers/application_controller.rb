class ApplicationController < ActionController::Base
 
  #authenticate_userメソッドは、devise側が用意しているメソッドです。
  #:authenticate_user!とすることによって、「ログイン認証されていなければ、
  #ログイン画面へリダイレクトする」機能を実装できます。
  before_action :authenticate_user!,expect:[:top]
  
   #devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
  #configure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters,if: :devise_controller?
  #パラメーターを取得します

  def after_sign_in_path_for(resource)
    post_images_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end


  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
  end
end
