class ApplicationController < ActionController::Base
  before_action :basic_auth
  # before_action :authenticate_user!,except: [:index, :show] #ログインしていない場合サインアップの画面に遷移する
  before_action :configure_permitted_parameters, if: :devise_controller?

  # # サインインしたらログインユーザーのTOP画面へ遷移する（不要）
  # def after_sign_in_path_for(resource)
  #   user_session_path
  # end

  # サインアウトしたらTOPへ遷移（不要）
  # def after_sign_out_path_for(resource)
  #   root_path
  # end


  protected

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end


    #passwordとemailはデフォルトであるので不要
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_reading, :last_name_reading, :birthday])
  end


end
