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
    money = params[:money] == "true" ? true : nil
    @applies = current_user.applies
    grade = Task.grades[params[:grade].to_sym].to_i
    # 用户权限
    permission = Permission.where(role: User.roles[current_user.role.to_sym], grade: grade, money: money).first
    # state: 0: 接包失败，1：接包成功，2；正在处理，3：任务完成
    # 用户：对应等级任务的，同时接包数量
    meanwhile_count = @applies.where(state: [1, 2], task_grade: grade).size
    # 用户：对应等级任务的，接包数量/本月
    month_count = @applies.by_month(Date.today.month).where(state: [1, 2, 3], task_grade: grade).size

    if meanwhile_count < permission.meanwhile && month_count < permission.receive_per_month
      @apply = Apply.new(apply_params)
      if @apply.save
        respond_with @apply
      else
        respond_to do |format|
          flash[:alert] = "申请任务失败"
          format.js { render js: "location.href='#{task_path(@apply.task_id)}'" }
        end
      end
    else
      info = {
        type: "rookie",
        task_grade: Task::GRADE[params[:grade].to_sym],
        money: money.present? ? "涉及现金" : "不涉及现金",
        vip_per_month: permission.receive_per_month,
        count_per_month: month_count,
        vip_total: permission.meanwhile,
        count_total: meanwhile_count 
      }
      respond_to do |format|
        format.js { render js: "location.href='#{vip_user_path(current_user, info: info)}'" }
      end
    end
  end

  def destroy
    Apply.find(params[:id]).destroy
    redirect_to feedback_user_path(current_user)
  end

  private
    def apply_params
      params.require(:apply).permit(:user_id, :task_id, :state, :money, :task_grade, :grade)
    end
end
