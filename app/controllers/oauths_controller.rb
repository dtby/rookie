class OauthsController < ApplicationController
  before_action :store_reurl

  def index
    openid = session[:openid]
    if openid.present?
      redirect_to session[:recurl] || root_path
    else  
      url = $client.authorize_url check_oauths_url
      redirect_to url
    end
  end

  def check
    result = $client.get_oauth_access_token(params[:code])
    openid = result.result["openid"]
    session[:openid] = openid
    # subscriber = Subscriber.where(openid: openid).first
    # if subscriber.present?
      redirect_to session[:recurl] || root_path
    # else
      # redirect_to wechat_error_path
    # end
  end

  def store_reurl
    session[:recurl] = params[:recurl] if params[:recurl].present?
    session[:target_url] = params[:target_url] if params[:target_url].present?
  end
end