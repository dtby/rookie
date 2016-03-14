class PagesController < BaseController
  before_action :set_user, only: [:resume, :info, :update_info]
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

  def update_info
    if @user.update_columns(user_params)
      flash.now[:notice] = "更新成功"
      user = User.find_by(open_id: session[:openid])
      if user
        current_user = user
        return redirect_to resume_user_pages_path(@user)
      else
        return redirect_to explain_user_path(@user)
      end
    else
      return render info_user_pages_path(@user)
    end
  end
  
  private

    def set_user
      @user = User.find(params[:user_id])
    end

    def user_params
      params.require(:user).permit(:number, :nickname, :name, :birth, :nation, :gender, :phone, :native, :email, :present, :constellation, :open_id)
    end
end
