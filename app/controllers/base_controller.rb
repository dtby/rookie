class BaseController < ApplicationController
  include ApplicationHelper

  before_action :weixin_global
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private
  def weixin_global
    unless $client.try(:is_valid?)
      $client ||= WeixinAuthorize::Client.new(ENV["APPID"], ENV["APPSECRET"])
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:message, :login]
  end
end
