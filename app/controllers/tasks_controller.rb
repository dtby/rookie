class TasksController < ApplicationController
  # before_action :set_task
  def index
  end

  def new
    @task = Task.new
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
      redirect_to tasks_path
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
    params.require(:task).permit(:name, :deleted_at)
  end
  # def set_task
  #   @task = Task.find(params[:id])
  # end
end
