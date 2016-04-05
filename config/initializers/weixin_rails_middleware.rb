# encoding: utf-8
# Use this hook to configure WeixinRailsMiddleware bahaviors.
WeixinRailsMiddleware.configure do |config|

  ## NOTE:
  ## If you config all them, it will use `weixin_token_string` default

  ## Config public_account_class if you SAVE public_account into database ##
  # Th first configure is fit for your weixin public_account is saved in database.
  # +public_account_class+ The class name that to save your public_account
  # config.public_account_class = "PublicAccount"

  ## Here configure is for you DON'T WANT TO SAVE your public account into database ##
  # Or the other configure is fit for only one weixin public_account
  # If you config `weixin_token_string`, so it will directly use it
  config.weixin_token_string = '529f2ed084b685624be3bde1'
  # using to weixin server url to validate the token can be trusted.
  config.weixin_secret_string = '6f719d088020a1ed5b6dbf8eda94c2b4'
  # 加密配置，如果需要加密，配置以下参数
  config.encoding_aes_key = 'FNeadBk1tyGukdK5uMC09uOqSFYNwMYt1PQlS0ufDBr'
  config.app_id = "wx8cbc369ae3d74887"

  ## You can custom your adapter to validate your weixin account ##
  # Wiki https://github.com/lanrion/weixin_rails_middleware/wiki/Custom-Adapter
  # config.custom_adapter = "MyCustomAdapter"
  $client ||= WeixinAuthorize::Client.new(WeixinRailsMiddleware.config.app_id, WeixinRailsMiddleware.config.weixin_secret_string)
end
