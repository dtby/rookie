class AppliesController < ApplicationController
  before_action :set_user
  def index
    @applies = current_user.apply.all
  end

  def new
  end

  def show
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

  def edit
  end

  def update
    if @apply.update(apply_params)
      flash.now[:notice] = "更新成功"
      redirect_to apply_path
    else
      render :update
    end
  end

  def destroy
    @apply.destroy
    redirect_to applies_path
  end

  private

  def apply_params
    params.require(:apply).permit(:user_id, :task_id, :state)
  end
  def set_user
    @user = current_user
  end
end
