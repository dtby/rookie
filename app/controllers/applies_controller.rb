class AppliesController < BaseController
  load_and_authorize_resource param_method: :apply_params
  respond_to :js, :json

  def index
    @task = Task.find(params[:task_id])
    applies_all = @task.applies
    if applies_all.success.count == @task.member_count
      @applies = applies_all.success
    else
      @applies = applies_all
    end
  end

  def show
    @apply = Apply.find(params[:id])
    @mark = @apply.deal_apply(params[:task_id])
    respond_with @apply
  end

  def create
    # 用户权限
    money = params[:money] == "true" ? true : nil
    permission = Permission.where(role: User.roles[current_user.role.to_sym], grade: params[:grade].to_i, money: money).first
    # 用户同时接包数量
    meanwhile_count = current_user.applies.success.size
    # 用户本月接包数量
    month_applies = current_user.applies.by_month(Date.today.month)
    month_count = month_applies.success.size + month_applies.complete.size

    if meanwhile_count < permission.meanwhile && month_count < permission.receive_per_month
      @apply = Apply.new(apply_params)
      if @apply.save
        redirect_to :index
      else
        render :new
      end
    else
      respond_to do |format|
        format.js { render js: "location.href='#{vip_user_path(current_user)}'" }
      end
    end
  end

  private

  def apply_params
    params.require(:apply).permit(:user_id, :task_id, :state, :money, :grade)
  end

  def set_user
    @user = current_user
  end
end
