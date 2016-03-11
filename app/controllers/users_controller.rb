class UsersController < BaseController
  before_action :set_user, only: [:edit, :show, :update, :personal]
  before_action :is_user_login?, only:[:feedback]
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

  # 一键注册
  def new
    user = User.find_by(open_id: session[:openid])
    if user
      @user = user
    else
      @user = User.create
    end
    return redirect_to edit_user_path(@user)
  end

  def create   
  end

  # 微信菜单：我的信息（获取用户）
  def user_info
    redirect_to user_path(current_user)
  end

  # 微信菜单：我的主页 （获取用户）
  def user_page
    redirect_to user_pages_path(current_user)
  end

  # 注册后的说明页
  def explain
  end

  # 完善个人基本信息
  def personal
    pp session[:openid]
  end

  def edit
  end

  def update
    if @user.update_columns(user_params)
      flash.now[:notice] = "更新成功"
      user = User.find_by(open_id: session[:openid])
    if user
      current_user = user
      return redirect_to user_path(@user)
    else
      return redirect_to explain_user_path(@user)
    end
    else
      return render :update
    end
  end

  # 投递反馈
  def feedback
    @applies = current_user.applies
  end

  # 充值会员
  def vip
    @info = params[:info]
  end

  private
    def user_params
      params.require(:user).permit(:number, :nickname, :name, :birth, :nation, :gender, :phone, :native, :email, :present, :constellation, :open_id)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
