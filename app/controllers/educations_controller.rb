class EducationsController < ApplicationController
  before_action :set_user
  before_action :find_edu, only: [:destroy, :create, :update, :edit]
  respond_to :js, :json
  def index
  end

  def new
    @education = Education.new
  end

  def create
    @education = @user.educations.create(education_params)
    if @education.save
      flash.now[:notice] = "创建成功"
      respond_with @education
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @education.update(education_params)
      flash.now[:notice] = "更新成功"
      redirect_to education_path
    else
      render :update
    end
  end

  def destroy
    @education = Education.find(params[:id])
    @education.destroy
    respond_with @education
  end

  private

  def education_params
    params.require(:education).permit(:stage, :time, :name)
  end
  def set_user
    @user = current_user
  end
  def find_edu
    @educations = current_user.educations
  end
end