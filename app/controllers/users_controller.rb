class UsersController < BaseController
  before_action :set_user
  def index	
  end

  # 个人信息
  def show
    @sign_in = Sign.where(user_id:current_user.id).last
    if @sign_in.try(:created_at).try(:to_date) == Time.now.to_date
      @signed = true
    else
      @signed = false
    end
  end

  def update
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
    @user = User.find(params[:id])
  end
end
