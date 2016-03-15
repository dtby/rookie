class TasksController < BaseController
  load_and_authorize_resource param_method: :task_params
  before_action :is_user_login?, only: [:index]
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete, :tag, :remove]
  before_action :set_user

  respond_to :js, :json
  def index
    @tasks = Task.where.not(state: 1).order(grade: :desc)
  end

  def personal_tasks
    @personal_tasks = current_user.tasks.all
  end

  def search_city
    @option = params[:option]
    @province = params[:province]
    @type = params[:type]
    @typ = params[:typ]
    @city = params[:city]

    if @type.present? && params[:figure] == "figure"
      @tasks = Task.order(p_figure: :desc)
    elsif @type.present? && params[:communicate] == "communicate"
      @tasks = Task.order(p_communicate: :desc)
    elsif @type.present? && params[:decision] == "decision"
      @tasks = Task.order(p_decision: :desc)
    elsif @type.present? && params[:control] == "control"
      @tasks = Task.order(p_control: :desc)
    elsif @type.present? && params[:coordination] == "coordination"
      @tasks = Task.order(p_coordination: :desc)
    elsif @type.present? && params[:unlimit] == "unlimit"
      @tasks = Task.order(grade: :desc)
    elsif @typ.present?
      @tasks = Task.where(task_type: params[:option]).order(grade: :desc)
    else
      @tasks = Task.order(grade: :desc)
    end
  end

  #点击右侧选项，刷新任务列表
  def search_task
    
  end

  def new
    @task = Task.new
  end

  def show
    @apply = Apply.new
  end

  def create
    # 可发包数量
    release = Permission.where(role: User.roles[current_user.role.to_sym], grade: Task.grades[task_params[:grade].to_sym]).first.release
    # 已发包数量
    released = current_user.tasks.send(task_params[:grade]).size
    if released < release
      @task = Task.new(task_params)
      if @task.save
        current_user.grow_logs.create!(content: "发包成功：#{task_params[:name]}", grow_type: 4)
        flash.now[:notice] = "创建成功"
        redirect_to tasks_path
      else
        render :new
      end
    else
      info = {
        type: "boss",
        task_grade: Task::GRADE[task_params[:grade].to_sym],
        release_count: release
      }
      redirect_to vip_user_path(current_user, info: info)
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(task_params)
      flash.now[:notice] = "更新成功"
      redirect_to task_path
    else
      render :update
    end
  end

  # 任务完成归档
  def complete
    @success = @task.complete_task
    respond_with :js
  end

  def destroy
    @task.destroy
    redirect_to personal_tasks_tasks_path
  end

    #添加标签
  def tag
    if params[:tag].present?
      @task.tag_list.add(params[:tag] ) 
      @task.save
    end
    respond_with @task
  end

  #删除标签
  def remove
    if params[:tag].present?
      @task.tag_list.remove(params[:tag])
      @task.save
    end
    respond_with @task
  end

  private

  def task_params
    params.require(:task).permit(:tag_list, :name, :task_type, :figure, :communicate, :coordination, :control, 
                                  :decision, :p_figure, :p_communicate, :p_coordination, :p_control, 
                                  :p_decision, :grade, :state, :deadline, :range, :user_id, :task_type_id, 
                                  :tab, :coin, :describe, :goal, :extra, :place, :p, :c, :a, :member_count)
  end

  def set_user
    @current_user ||= User.find_by(open_id: session[:openid])
    current_user = @current_user
    @user = current_user
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
