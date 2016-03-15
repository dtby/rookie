module PagesHelper
  def current_user
    @current_user ||= User.find_by(open_id: session[:openid])
    current_user = @current_user
  end
end
