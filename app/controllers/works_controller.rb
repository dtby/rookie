class WorksController < ApplicationController
  before_action :set_user
  before_action :find_work, only: [:destroy, :create, :update, :edit]
  respond_to :js, :json
  def index
  end

  def new
    @work = Work.new
  end

  def create
    @work = current_user.works.create(work_params)
    if @work.save
      flash.now[:notice] = "创建成功"
      respond_with @work
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @work.update(work_params)
      flash.now[:notice] = "更新成功"
      redirect_to work_path
    else
      render :update
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    respond_with @work
  end

  private

  def work_params
    params.require(:work).permit(:company, :position, :start_time, :end_time)
  end
  def set_user
    @user = current_user
  end
  def find_work
    @works = current_user.works
  end
end
