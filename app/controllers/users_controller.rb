class UsersController < BaseController
  before_action :set_user
  def index
  	
  end

  # 个人信息
  def show
  	
  end

  def update
    pp user_params[:gender]
    if @user.update_columns(user_params)
      flash.now[:notice] = "更新成功"
      redirect_to user_path
    else
      render :update
    end
  end

  private

  def user_params
    params.require(:user).permit(:number, :nickname, :name, :birth, :nation, :gender, :phone, :native, :email, :present, :constellation)
  end
  def set_user
    @user = current_user
  end
end
