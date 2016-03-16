class BaseController < ApplicationController
  include ApplicationHelper
  before_action :invoke_wx_auth
  before_action :validate_openid
  # before_action :authenticate_user!

  def is_user_login?
    user = User.find_by(open_id:session[:openid])
    user_info = $client.user(session[:openid]).result["headimgurl"]
    session[:imageurl] = $client.user(session[:openid]).result["headimgurl"]
    if user
      current_user = user
    else
      return redirect_to new_user_path
    end
  end


  private

  def validate_openid
    if session[:openid].blank?
      sns_info = $client.get_oauth_access_token(params[:code])
      if sns_info.result["errcode"] != "40029"
        u = User.find_by(open_id:sns_info.result["openid"])
        session[:openid] = nil
        if u
          session[:openid] = u.open_id
          current_user = u
        else
          session[:openid] = sns_info.result["openid"]
        end
      end
    end
  end

  def invoke_wx_auth
    if params[:state].present? || session['openid'].present? || session[:user_id].present? 
      return # 防止进入死循环授权
    end
      # 生成授权url，再进行跳转
      sns_url =  $client.authorize_url(request.url)
      redirect_to sns_url and return
  end
end
