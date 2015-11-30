class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def index
    @tasks = Task.all
  end

  def personal_tasks
    @personal_tasks = current_user.task.all
  end

  def apply
    # if params(:id).present?
    #   Apply.update(:state => true)
    #   @task = Task.find(params[:id])
    #   @active_applies  = Apply.where(:task_id => @task).state_is_ture
    # else
      @task = Task.find(params[:id])
      @active_applies  = Apply.where(:task_id => @task)
    # end
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
      flash.now[:notice] = "创建成功"
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash.now[:notice] = "更新成功"
      redirect_to task_path
    else
      render :update
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :figure, :communicate, :coordination, :control, :decision, :p_figure, :p_communicate, :p_coordination, :p_control, :p_decision, :grade, :state, :deadline, :range, :user_id, :task_type_id, :tab, :coin, :describe, :goal, :extra, :place)
  end
  def set_user
    @user = current_user
  end
end
