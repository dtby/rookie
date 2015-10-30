class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :weixin_global
  include ApplicationHelper

  private
  def weixin_global
    unless $client.try(:is_valid?)
      $client ||= WeixinAuthorize::Client.new(ENV["APPID"], ENV["APPSECRET"])
    end
  end
end
