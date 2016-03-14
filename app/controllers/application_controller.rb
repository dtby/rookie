class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :weixin_global

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # 无权限后的操作
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to vip_user_path(current_user), :alert => exception.message
  end

  private
  def weixin_global
    unless $client.try(:is_valid?)
      # $client ||= WeixinAuthorize::Client.new(WeixinRailsMiddleware.config.app_id, WeixinRailsMiddleware.config.weixin_secret_string)
      $client ||= WeixinAuthorize::Client.new(ENV["APPID"], ENV["APPSECRET"])
    end
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << [:message, :phone, :email]
  # end
end
