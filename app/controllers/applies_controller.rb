class AppliesController < BaseController
  respond_to :js, :json
  def index
    @applies = current_user.apply.all
  end

  def show
    @task = Task.find(params[:id])
    if @task.state.present?
      @active_applies  = Apply.where(:task_id => @task, state: true)
    else
      @active_applies  = Apply.where(:task_id => @task)
    end
  end

  def create
    @apply = Apply.new(apply_params)
    if @apply.save
      flash.now[:notice] = "创建成功"
      redirect_to applies_path
    else
      render :new
    end
  end

  def deal
    @task = Task.where(id: params[:id]).first
    @task.update_columns(state: true)
    @active_apply = Apply.where(id: params[:active_apply]).first
    @active_apply.update_columns(state: true)
    @active_applies = Apply.where(task_id: params[:id], state: true)
  end

  private

  def apply_params
    params.require(:apply).permit(:user_id, :task_id, :state)
  end
  def set_user
    @user = current_user
  end
end
