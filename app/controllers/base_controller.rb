class BaseController < ApplicationController
  include ApplicationHelper
  before_action :invoke_wx_auth
  # before_action :authenticate_user!

  def is_user_login?
    sns_info = $client.get_oauth_access_token(params[:code])
    if sns_info.result["errcode"] != "40029"
      session[:openid] = sns_info.result["openid"]
    end

    user = User.find_by(open_id: session["openid"])

    if user
      current_user = user
      # return redirect_to explain_user_path(current_user)
    else
      return redirect_to new_user_path
    end
  end

  private
  def invoke_wx_auth
    if params[:state].present? || session['openid'].present? || session[:user_id].present? 
      return # 防止进入死循环授权
    end
    # if params["need_wx_auth"].present?
      # 生成授权url，再进行跳转
      sns_url =  $client.authorize_url(request.url)
      redirect_to sns_url and return
    # end
  end

  # 在invoke_wx_auth中做了跳转之后，此方法截取
  # def get_wechat_sns
  #   # params[:state] 这个参数是微信特定参数，所以可以以此来判断授权成功后微信回调。
  #   if session[:openid].blank?
  #     sns_info = $client.get_oauth_access_token(params[:code])
  #     Rails.logger.debug("Weixin oauth2 response: #{sns_info.result}")
  #     # 重复使用相同一个code调用时：
  #     if sns_info.result["errcode"] != "40029"
  #       session[:openid] = sns_info.result["openid"]
  #       user = User.where(open_id: session[:openid]).first
  #       pp user
  #       if user.present?
  #         current_user = user
  #         pp "=====-----"
  #         redirect_to explain_user_path
  #       else
  #         redirect_to new_user_path
  #       end
  #     end
  #   end
  # end
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << [:message, :phone]
  # end
end
