class UsersController < BaseController
  before_action :set_user, only: [:show, :update, :personal]

  # 个人信息
  def show
    @grow_logs = @user.grow_logs
    @sign_in = Sign.where(user_id:current_user.id).last
    if @sign_in.try(:created_at).try(:to_date) == Time.now.to_date
      @signed = true
    else
      @signed = false
    end
  end

  # 注册后的说明页
  def explain
  end

  # 完善个人基本信息
  def personal
  end

  def update
    if @user.update_columns(user_params)
      flash.now[:notice] = "更新成功"
      redirect_to user_path
    else
      render :update
    end
  end

  # 投递反馈
  def feedback
    @applies = current_user.applies
  end

  # 充值会员
  def vip
    @info = params[:info]
    pp @info
  end

  private
    def user_params
      params.require(:user).permit(:number, :nickname, :name, :birth, :nation, :gender, :phone, :native, :email, :present, :constellation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
