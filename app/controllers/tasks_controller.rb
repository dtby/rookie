class TasksController < BaseController
  load_and_authorize_resource param_method: :task_params
  
  before_action :set_user
  respond_to :js, :json
  def index
    @tasks = Task.order(grade: :desc)
  end

  def personal_tasks
    @personal_tasks = current_user.tasks.all
  end

  def search_city
    @option = params[:option]
    @province = params[:province]
    @type = params[:type]
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
    else
    @tasks = Task.order(grade: :desc)
    end
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
    @apply = Apply.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      current_user.grow_logs.create!(content: "发包成功：#{task_params[:name]}", grow_type: 4)
      flash.now[:notice] = "创建成功"
      redirect_to tasks_path
    else
      render :new
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

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to personal_tasks_tasks_path
  end

    #添加标签
  def tag
    if params[:tag].present?
      @task = Task.where(id: params[:id]).first
      @task.tag_list.add(params[:tag] ) 
      @task.save
    end
     
    respond_with @task
  end

  #删除标签
  def remove
    if params[:tag].present?
      @task = Task.where(id: params[:id]).first
      @task.tag_list.remove(params[:tag] )
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
    @user = current_user
  end
end
