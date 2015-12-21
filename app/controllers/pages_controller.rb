class PagesController < BaseController
  before_action :set_user, only: [:resume, :info]
  respond_to :js, :json

  def index

  end

  def resume
    @educations = current_user.educations
    @works = current_user.works
    @internships = current_user.internships
  end

  def info
  end
  
  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
