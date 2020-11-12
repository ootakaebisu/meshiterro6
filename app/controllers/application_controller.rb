class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されている
    # 今回のケースでは、ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
