class PagesController < BaseController
  before_action :set_user 
  respond_to :js, :json
  def index
    
  end

  def resume
    @educations = current_user.education
    @works = current_user.work
    @internships = current_user.internship
  end

  def info
  end
  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
