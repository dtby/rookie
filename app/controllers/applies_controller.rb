class AppliesController < BaseController
  respond_to :js, :json
  def index
    task = Task.find(params[:task_id])
    applies_all = task.applies
    if applies_all.success.count == task.member_count
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
    @apply = Apply.new(apply_params)
    if @apply.save
      flash.now[:notice] = "创建成功"
      #redirect_to applies_path
    else
      render :new
    end
  end

  private

  def apply_params
    params.require(:apply).permit(:user_id, :task_id, :state)
  end

  def set_user
    @user = current_user
  end
end
