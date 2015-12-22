class BaseController < ApplicationController
  include ApplicationHelper

  before_action :weixin_global
  before_action :authenticate_user!

  private
  def weixin_global
    unless $client.try(:is_valid?)
      $client ||= WeixinAuthorize::Client.new('wx8cbc369ae3d74887', '6f719d088020a1ed5b6dbf8eda94c2b4')
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:message, :phone]
  end
end
