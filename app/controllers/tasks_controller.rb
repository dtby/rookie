class TasksController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_task
  before_action :set_user
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash.now[:notice] = "创建成功"
      redirect_to user_tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash.now[:notice] = "更新成功"
      redirect_to user_task_path
    else
      render :update
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def show
  end

  private

  def task_params
    params.require(:task).permit(:name, :figure, :communicate, :coordination, :control, :decision, :p_figure, :p_communicate, :p_coordination, :p_control, :p_decision, :grade, :name, :state, :deadline, :range, :coin, :describe, :goal, :extra, :place)
  end
  def set_task
    @task = Task.find(params[:id])
  end
  def set_user
    @user = User.find(params[:user_id])
  end
end
