class BaseController < ApplicationController
  include ApplicationHelper

  before_action :weixin_global
  before_action :authenticate_user!

  private
  def weixin_global
    unless $client.try(:is_valid?)
      $client ||= WeixinAuthorize::Client.new(ENV["APPID"], ENV["APPSECRET"])
    
      $client.authorize_url(redirect_url)
      # 回调后，获取code请求token或者openid:
      sns_info = $client.get_oauth_access_token(params[:code])
      # 再调用以下API，拉取用户信息：
      user_info1 = $client.get_oauth_userinfo(openid, oauth_token)
    end

    # pp user_info1
    
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:message, :phone]
  end
end
